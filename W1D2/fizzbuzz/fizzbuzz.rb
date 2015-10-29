def fizzbuzz(start_num, end_num)

  (start_num..end_num).each do |num|
    fizz = num % 3 == 0 
    buzz = num % 5 == 0
    
    output = ""
    output << "Fizz" if fizz
    output << "Buzz" if buzz
    
    puts output.empty? ? num : output
  end
end

fizzbuzz(1, 100)