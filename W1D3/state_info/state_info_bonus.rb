@states = {
  OR: {
    name: 'Oregon',
    cities: ['Portland', 'Salem', 'Eugene']
    },
  FL: {
    name: 'Florida',
    cities: ['Miami', 'Tampa', 'Orland', 'Jacksonville']
    },
  CA: {
    name: 'California',
    cities: ['San Francisco', 'LA', 'San Diego'],
    },
  NY: {
    name: 'New York',
    cities: ['New York City', 'Buffalo', 'Rochester']
    },
  MI: {
    name: 'Michigan',
    cities: ['Grand Rapids', 'Detroit', 'Ann Arbor']
  }
}

@states[:IL] = { name: 'Illinois', cities: ['Chicago', 'Evanston', 'Springfield'] }
@states[:WA] = { name: 'Washington', cities: ['Seattle', 'Spokane', 'Tacoma']}

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
  full_name = @states[state][:name]
  cities = @states[state][:cities]
  city_count = cities.count
  city_string = cities.join(', ')

  description = "#{state} is for #{full_name}. "\
  "It has #{city_count} major cities: #{city_string}."

  description
end

def calculate_tax(state_code, amount)
  state = state_code.to_sym
  tax_rate = @taxes[state].to_f / 100
  tax_amount = (tax_rate * amount).round(2)
end

def find_state_for_city(city_name)
  @states.each do |state_code, state_info|
    return state_code if state_info[:cities].include? city_name
  end
end

puts describe_state(:MI)
puts describe_state('OR')
puts describe_state('WA')

# Expect 0.75
puts calculate_tax('OR', 10)
# Expect CA
puts find_state_for_city('San Francisco')
# Expect WA
puts find_state_for_city('Spokane')
# Expect no error
puts calculate_tax('KN', 5)
