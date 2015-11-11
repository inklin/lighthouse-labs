require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

total_revenue = Store.sum(:annual_revenue)
avg_revenue = Store.average(:annual_revenue)
puts "Total revenue for the Company: $#{total_revenue}"
puts "Average revenue for all stores: $#{avg_revenue.floor}"

million_dollar_stores = Store.where("annual_revenue > ?", [1_000_000])
puts "The number of stores with $1 million+ in annual revenue: #{million_dollar_stores.count}"

million_dollar_stores.each do |store|
  puts "Store Name: #{store.name} Annual Revenue #{store.annual_revenue}"
end