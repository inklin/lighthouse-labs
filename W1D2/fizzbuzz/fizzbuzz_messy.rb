def fizzbuzz(start, finish)
  start.upto(finish) { |number| puts get_output(number) }
end

def get_output(number)
  if div_3?(number) && div_5?(number)
    "FizzBuzz"
  elsif div_5?(number)
    "Buzz"
  elsif div_3?(number)
    "Fizz"
  else
    number
  end
end

def div_5?(number)
  number % 5 == 0
end

def div_3?(number)
  number % 3 == 0
end

start_num = 60
end_num = 80
fizzbuzz(start_num, end_num)