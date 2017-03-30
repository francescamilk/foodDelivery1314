require_relative 'app/repositories/order_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/models/order'
require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/models/employee'

# order = Order.new(
#   delivered: false,
#   meal: Meal.new(id: 2),
#   customer: Customer.new(id: 3),
#   employee: Employee.new(id: 42)
# )

# repo = OrderRepository.new("test_orders.csv")
# repo.add(order)

meals_repo = MealRepository.new('data/meals.csv')
repo = OrderRepository.new('test_orders.csv', meals_repo)

p repo
