# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'colorize'
require 'pry'
require './candidates'
require './filters'

def qualified_candidates(candidates)
  candidates.select { |candidate| pass_criteria?(candidate) }
end

def ordered_by_qualifications(candidates)

  sorted = candidates.sort do |a, b|
    if a[:years_of_experience] == b[:years_of_experience]
      b[:github_points] <=> a[:github_points]
    else
      b[:years_of_experience] <=> a[:years_of_experience]
    end
  end

  # using sort_by --> the block only takes one parameter and sorts the array by the result of each of the block calls
  # sort_by is faster than sort for performance 
  # sorted = candidates.sort_by { |candidate| [candidate[:years_of_experience], candidate[:github_points]]}
  
  pp sorted

end

#ordered_by_qualifications(@candidates)

def run_repl()
  quit_program = false
  until quit_program do
    input = gets.chomp

    case input
    when "quit"
      quit_program = true
    when "all"
      print_info(@candidates)
    when "qualified"
      qualified = qualified_candidates(@candidates)
      print_info(qualified)
    else
      if input.include?('find')
        candidate_id = find_id_from_input(input)
        candidate_info = find(candidate_id)
        print_info(candidate_info)
      end
    end
  end
end

def find_id_from_input(input)
  id = input[/\d+/].to_i
end

def print_info(info)
  case info
  when Array
    info.each do |item|
      print_color(item)
    end
  when Hash
    print_color(info)
  end
end

def print_color(person)
  pass = pass_criteria? (person)
  output = person.to_s
  if pass
    puts output.colorize(:green)
  else
    puts output.colorize(:red)
  end
end

run_repl()

# Driver Code below

# pp @candidates
# qualified_candidates = qualified_candidates(@candidates)
# pp "The list of qualified candidates are:" 
# pp qualified_candidates


# candidate1 = {
#     id: 10,
#     years_of_experience: 3,
#     github_points: 232,
#     languages: ['Java', 'Ruby', 'JavaScript'],
#     date_applied: 12.days.ago.to_date,
#     age: 31
#   }

# candidate2 = {
#     id: 7,
#     years_of_experience: 1,
#     github_points: 145,
#     languages: ['JavaScript', 'Ruby', 'Go', 'Erlang'],
#     date_applied: 30.days.ago.to_date,
#     age: 16
#   }

# puts "applied_in_time? should return true for applications within limit"
# puts applied_in_time?(candidate1) == true

# puts "applied_in_time? should return false for applications outside limit"
# puts applied_in_time?(candidate2) == false
# check_application_date should return false for applications outside limit

# puts "of_age? should return false for underage candidate"
# puts of_age?(candidate2) == false

# puts "of_age? should return true for candidate 18+ in age"
# puts of_age?(candidate1) == true