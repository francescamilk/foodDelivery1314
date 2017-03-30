require_relative 'app/repositories/meal_repository'

csv_file = 'data/meals.csv'
repo = MealRepository.new(csv_file)

repo.add(Meal.new(name: 'Regina', price: 10))
