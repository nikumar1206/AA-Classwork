require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries #title -> salary 
        @employees = []
    end

    def valid_title?(title)
        salaries.include?(title)
    end

    def >startup_2
        @funding > startup_2.funding
    end

    def hire(name, title)
        if !salaries.include?(title)
            raise ArgumentError.new("not valid title")
        else
            new_empl = Employee.new(name, title)
            employees << new_empl
        end
    end

    def size
        @employees.length
    end

    def pay_employee(empl)
        if @funding < @salaries[empl.title]
            raise "not enough funding to pay employee"
        else
            @funding -= @salaries[empl.title]
            empl.pay(@salaries[empl.title])
        end

    end

    def payday
        @employees.each {|empl| pay_employee(empl)}
    end

    def average_salary
        employees.map {|empl| @salaries[empl.title] }.sum.to_f/employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup_2)
        @funding += startup_2.funding
        startup_2.salaries.each {|sal, v| @salaries[sal]= v if !@salaries.include?(sal) }
        startup_2.employees.each { |empl| @employees << empl }
        startup_2.close
    end

end
