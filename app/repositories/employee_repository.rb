require_relative "../models/employee"
require_relative "base_repository"

class EmployeeRepository < BaseRepository

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  def all_delivery_guys
    @elements.select { |employee| employee.delivery_guy? }
  end

  # undef_method :all

  private

  def build_element(row)
    row[:id]       = row[:id].to_i      # Convert column to Fixnum
    Employee.new(row)
  end
end
