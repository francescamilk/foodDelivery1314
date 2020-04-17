require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @session_view = SessionsView.new
    @employee_repository = employee_repository
  end

  def login
    username = @session_view.ask_for(:username)
    password = @session_view.ask_for(:password)
    employee = @employee_repository.find_by_username(username)
    return employee if employee && employee.password == password

    @session_view.print_wrong_credentials
    login
  end
end
