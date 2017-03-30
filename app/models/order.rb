class Order
  attr_reader :customer, :employee, :meal
  attr_accessor :id

  def initialize(attributes = {})
    # id, delivered(boolean), meal, customer, employee
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def to_csv_row
    [@id, @delivered, @meal.id, @customer.id, @employee.id]
  end

  def self.headers
    %w(id delivered meal_id customer_id employee_id)
  end
end
