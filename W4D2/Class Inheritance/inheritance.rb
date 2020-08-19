class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = self.salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def add_employee(employee)
        employees << employee
        employee
    end

    def bonus(multiplier)
        bonus = self.total_salary * multiplier
    end

    def total_salary
        total_subsalary = 0
        self.employees.each do |employee|
            if employee.is_a?(Manager)
                total_subsalary += employee.salary + employee.total_salary
            else
                total_subsalary += employee.salary
            end
        end
        total_subsalary
    end
end

Ned = Manager.new("Ned", "Founder", 1000000, nil)

Darren = Manager.new("Darren", "TA Manager", 78000, Ned)

Shawna = Employee.new("Shawna", "TA", 12000, Darren)

David = Employee.new("David", "TA", 10000, Darren)

p "bonus time!"

Ned.add_employee(Darren)
Darren.add_employee(Shawna)
Darren.add_employee(David)

p Ned.bonus(5)
p Darren.bonus(4)
p David.bonus(3)

#NOTES FROM FLEX TIME
# def dfs 
#     sum = 0
#     self.employees.each do |employee|
#         sum += employee.salary
#         if employee.instance_of?(Manager)
#            sum +=  employee.dfs
#         end
#     end
#     sum
# end
# end

# def bfs
#     sum = 0
#     queue = [self]
#     until queue.empty? 
#         current = queue.shift
#         if current.instance_of?(Manager)
#             current.employees.each do |employee| 
#                 sum += employee.salary 
#                 queue << employee
#             end
#         end
#     end
#     sum 
# end