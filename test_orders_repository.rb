require_relative "app/repositories/orders_repository"
require_relative "app/repositories/meals_repository"
require_relative "app/models/order"
require_relative "app/models/meal"
require_relative "app/models/customer"
require_relative "app/models/employee"

# order = Order.new(
#   delivered: false,
#   meal: Meal.new(id: 2),
#   customer: Customer.new(id: 3),
#   employee: Employee.new(id: 42)
# )

# repo = OrdersRepository.new("test_orders.csv")
# repo.add(order)


meals_repo = MealsRepository.new("data/meals.csv")
repo = OrdersRepository.new("test_orders.csv", meals_repo)

p repo
