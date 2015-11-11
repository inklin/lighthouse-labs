require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store1.employees.create(first_name: 'Stacey', last_name: 'Lin', hourly_rate: 30)
@store1.employees.create(first_name: 'Charlie', last_name: 'Brown', hourly_rate: 50)
@store1.employees.create(first_name: 'Linus', last_name: 'Pelt', hourly_rate: 15)

@store2.employees.create(first_name: 'Jay', last_name: 'Chou', hourly_rate: 1000)
@store2.employees.create(first_name: 'John', last_name: 'Smith', hourly_rate: 50)
@store2.employees.create(first_name: 'Jane', last_name: 'Doe', hourly_rate: 30)
@store2.employees.create(first_name: 'Peanut', last_name: 'Butter', hourly_rate: 5)

puts "Store 1 has #{@store1.employees.count} employees"
puts "Store 2 has #{@store2.employees.count} employees"

puts "Total number of employees at all stores: #{Employee.count}"