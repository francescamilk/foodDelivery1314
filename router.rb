class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
    @employee = nil # Optional
  end

  def run
    while @running do
      @employee = @sessions_controller.sign_in
      while @employee
        if @employee.manager?
          print_manager_menu
          action = ask_user_for_action
          route_manager_action(action)
        else
          print_delivery_guy_menu
          action = ask_user_for_action
          route_delivery_guy_action(action)
        end
      end
      print `clear`
    end
  end

  private

  def print_manager_menu
    puts "1. Add a meal"
    puts "2. List available meals"
    puts "3. Add a customer"
    puts "4. List customers"
    puts "5. Add an order"
    puts "6. List undelivered orders"
    puts "8. Sign out"
    puts "9. Exit"
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 8 then @employee = nil
    when 9
      @employee = nil
      @running = false
    else
      puts "Wrong action"
    end
  end

  def print_delivery_guy_menu
    puts "1. List my orders"
    puts "2. Mark an ordered as delivered"
    puts "8. Sign out"
    puts "9. Exit"
  end

  def route_delivery_guy_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 8 then @employee = nil
    when 9
      @employee = nil
      @running = false
    else
      puts "Wrong action"
    end
  end

  def ask_user_for_action
    puts "What do you want to do next?"
    print "> "
    return gets.chomp.to_i
  end
end
