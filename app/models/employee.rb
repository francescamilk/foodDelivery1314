class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @orders = []
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def add_order(order)
    order.employee = self
    @orders << order
  end

  def manager?
    @role == "manager"
  end

  def delivery_guy?
    @role == "delivery_guy"
  end
end
