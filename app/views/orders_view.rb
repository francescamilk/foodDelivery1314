require_relative "base_view"

class OrdersView < BaseView
  def ask_for_id(label)
    puts "#{label} id?"
    print "> "
    gets.chomp.to_i
  end

  def print_employees(employees)
    employees.each do |employee|
      puts "#{employee.id}. #{employee.username}"
    end
  end

  def print_orders(orders)
    orders.each do |order|
      puts "#{order.id}. #{order.meal.name} for #{order.customer.name}, delivered by #{order.employee.username.capitalize}"
    end
  end
end
