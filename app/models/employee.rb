class Employee
    def initialize(attrs = {})
        @id = attrs[:id]
        @username = attrs[:username]
        @password = attrs[:password]
        @role = attrs[:role]
    end

    attr_reader :username, :password, :role
    attr_accessor :id

    def manager?
        return @role == "manager"
    end

    def rider?
        return @role == "rider"
    end
end
