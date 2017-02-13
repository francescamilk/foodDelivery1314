require_relative "app/repositories/employee_repository"

csv_path = "data/employees.csv"

repository = EmployeeRepository.new(csv_path)

p repository
