require_relative 'app/repositories/employee_repository'

csv_path = 'data/employees.csv'
repo = EmployeeRepository.new(csv_path)

p repo
