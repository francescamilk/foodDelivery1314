require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/sessions_view"
require_relative "../views/orders_view"

class OrdersController
    def initialize(meal_repo, customer_repo, employee_repo, order_repo)
        @meal_repo = meal_repo
        @customer_repo = customer_repo
        @employee_repo = employee_repo
        @order_repo = order_repo

        @meals_view = MealsView.new
        @customers_view = CustomersView.new
        @sessions_view = SessionsView.new
        @orders_view = OrdersView.new
    end

    def add
        meals = @meal_repo.all
        @meals_view.display(meals)
        meal_id = @orders_view.ask_index
        meal = meals[meal_id]

        customers = @customer_repo.all
        @customers_view.display(customers)
        customer_id = @orders_view.ask_index
        customer = customers[customer_id]

        riders = @employee_repo.all_riders
        @sessions_view.display(riders)
        rider_id = @orders_view.ask_index
        rider = riders[rider_id]

        order = Order.new(meal: meal, customer: customer, employee: rider)
        @order_repo.create(order)
    end

    def list_undelivered_orders
        orders = @order_repo.undelivered_orders
        @orders_view.display(orders)
    end

    def list_my_orders(rider)
        display_undelivered(rider)
    end

    def mark_as_delivered(rider)
        orders = display_undelivered(rider)
        index = @orders_view.ask_index
        order = orders[index]
        @order_repo.update_mark(order)
    end

    private

    def display_undelivered(rider)
        orders = @order_repo.my_undelivered_orders(rider)
        @orders_view.display(orders)
        return orders
    end
end
