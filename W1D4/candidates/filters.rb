# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

def find(id)
  @candidates.select{ |candidate| candidate[:id] == id }
end

def enough_github_points?(candidate)
  min_points = 100
  candidate[:github_points] >= min_points
end

def knows_languages?(candidate)
  languages = ['Ruby', 'Python']
  matches = candidate[:languages] & languages

  matches.empty? ? false : true
end

def applied_in_time?(candidate)
  days_range = 15
  application_date = candidate[:date_applied]
  acceptable_date = days_range.days.ago.to_date

  # Comparing two dates with a <=> b 
  # returns 0 if two dates are same
  # returns -1 if b is after a
  # returns 1 if b is before a
  (acceptable_date <=> application_date) < 0 ? true : false
end

def of_age?(candidate)
  candidate[:age] >= 18
end

def pass_criteria?(candidate)
  experienced?(candidate) && enough_github_points?(candidate) && knows_languages?(candidate) \
  && applied_in_time?(candidate) && of_age?(candidate)
end
