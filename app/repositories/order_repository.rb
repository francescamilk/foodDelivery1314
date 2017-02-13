require_relative "base_repository"

class OrderRepository < BaseRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository

    super(csv_file)
  end

  def all_undelivered_orders
    @elements.select { |order| !order.delivered? }
  end

  def my_undelivered_orders(employee)
    @elements.select { |order| !order.delivered? && order.employee == employee }
  end

  def save
    write_csv
  end

  private

  # called in load_csv
  def build_element(row)
    meal = @meal_repository.find(row[:meal_id].to_i)
    customer = @customer_repository.find(row[:customer_id].to_i)
    employee = @employee_repository.find(row[:employee_id].to_i)

    Order.new({
      id: row[:id].to_i,
      delivered: row[:delivered] == "true",
      meal: meal,
      customer: customer,
      employee: employee
    })
  end
end
