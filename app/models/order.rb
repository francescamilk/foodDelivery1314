class Order
    def initialize(attrs = {})
        @id        = attrs[:id]          # Integer
        @delivered = attrs[:delivered] || false
        @meal      = attrs[:meal]        # Meal
        @customer  = attrs[:customer]    # Customer
        @employee  = attrs[:employee]    # Employee
    end

    attr_reader :meal, :customer, :employee
    attr_accessor :id

    def delivered?
        return @delivered
    end

    def deliver!
        @delivered = true
    end
end
