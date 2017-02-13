require_relative "../views/orders_view"
require_relative "../models/order"

class OrdersController
  def initialize(customer_repository, meal_repository, employee_repository, order_repository)
    @customer_repository = customer_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
  end

  def mark_as_delivered(employee)
    # 1. Display all my undelivered orders
    list_my_orders(employee)
    # 2. Ask for an order id
    order_id = @view.ask_for_id(:order)
    # 3. Fetch the order from the order repo
    order = @order_repository.find(order_id)
    # 4. Mark the order as delivered
    order.deliver!
    # 5. SAVE TO CSV
    @order_repository.save
  end

  def list_my_orders(employee)
    orders = @order_repository.my_undelivered_orders(employee)
    @view.print_orders(orders)
  end

  def list_undelivered_orders
    # 1. Fetch the undelivered orders from order repo
    orders = @order_repository.all_undelivered_orders
    # 2. Display them
    @view.print_orders(orders)
  end

  def add
    # 1. List all the customers
    CustomersController.new(@customer_repository).list
    # 2. Ask user for customer id
    customer_id = @view.ask_for_id(:customer)
    # 3. Find the customer in the customer repo
    customer = @customer_repository.find(customer_id)

    # 4. List all the meals
    MealsController.new(@meal_repository).list
    # 5. Ask user for meal id
    meal_id = @view.ask_for_id(:meal)
    # 6. Find the meal in the meal repo
    meal = @meal_repository.find(meal_id)

    # 7. List all delivery guys
    delivery_guys = @employee_repository.all_delivery_guys
    @view.print_employees(delivery_guys)
    # 8. Ask user for employee id to assign the order
    employee_id = @view.ask_for_id(:employee)
    # 9. Find the employee in the employee repo
    employee = @employee_repository.find(employee_id)

    # 10. Create the order
    order = Order.new(customer: customer, meal: meal, employee: employee)
    # 11. Add the order to the order repo.
    @order_repository.add(order)
  end
end
