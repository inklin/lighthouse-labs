@states = {
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan'
}

@states[:IL] = 'Illinois'
@states[:WA] = 'Washington'

@cities = {
  OR: ['Portland', 'Salem', 'Eugene'],
  FL: ['Miami', 'Tampa', 'Orland', 'Jacksonville'],
  CA: ['San Francisco', 'LA', 'San Diego'],
  NY: ['New York City', 'Buffalo', 'Rochester'],
  MI: ['Grand Rapids', 'Detroit', 'Ann Arbor'],
  IL: ['Chicago', 'Evanston', 'Springfield'],
  WA: ['Seattle', 'Spokane', 'Tacoma']
}

@taxes = {
  OR: 7.5,
  FL: 5,
  CA: 12,
  NY: 8,
  MI: 10,
  IL: 13,
  WA: 9
}

def describe_state(state_code)
  state = state_code.to_sym
  full_name = @states[state]
  city_count = @cities[state].count
  cities = @cities[state].join(', ')

  description = "#{state} is for #{full_name}. "\
  "It has #{city_count} major cities: #{cities}."

  description
end

def calculate_tax(state_code, amount)
  state = state_code.to_sym
  tax_rate = @taxes[state].to_f / 100
  tax_amount = (tax_rate * amount).round(2)
end

def find_state_for_city(city_name)
  state = @cities.select { |state_code, city_list| city_list.include? city_name }
  state.keys
end

puts describe_state(:MI)
puts describe_state('OR')
puts describe_state('WA')

puts calculate_tax('OR', 10)

puts find_state_for_city('San Francisco')
puts find_state_for_city('Spokane')
