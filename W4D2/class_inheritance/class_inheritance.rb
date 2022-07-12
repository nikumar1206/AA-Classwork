class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.employees.push(self) unless boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    total_salary * multiplier
  end

  def total_salary
    sum = 0
    employees.each do |employee|
      sum += employee.salary
      if employee.is_a?(Manager)
        sum += employee.total_salary
      end
    end
    sum
  end

  def add_employee(employee)
    employees.push(employee)
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000