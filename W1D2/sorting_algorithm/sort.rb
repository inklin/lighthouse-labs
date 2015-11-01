require 'benchmark'

def sort(arr)
  arr.sort
end

# Find the maximum 
def maximum(arr)
  sort(arr).last
end

def minimum(arr)
  sort(arr).first
end
 
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty array is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"

# Bubble Sort
def bubble_sort(arr)
  swapped = true;

  while swapped do
    swapped = false
    (0..arr.length-2).each do |index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swapped = true;
      end
    end
  end

  arr
end

result = bubble_sort([5, 3, 2, 6, 1, 4])
puts "Result of bubble sort on 5 3 2 1 4 is #{result}"

# Expect nil when empty array is passed in
puts "Bubble sort on empty array: #{bubble_sort([]).inspect}"


@i_count = 0
def insertion_sort(arr)
  (1..arr.length-1).each do |index|
    number = arr[index]
    new_index = index - 1

    while new_index >= 0 && arr[new_index] > number
      arr[new_index + 1] = arr[new_index]
      new_index -= 1
      @i_count += 1
    end
    arr[new_index + 1] = number
  end
  arr
end


# result = insertion_sort([5, 3, 2, 6, 1, 4])
# puts "result of insertion sort on 5 3 2 1 4 is #{result}"

# # Expect nil when empty array is passed in
# puts "Insertion sort on empty array: #{insertion_sort([]).inspect}"

@r_count = 0
def rosetta_insertion_sort(arr)
  (1..arr.length-1).each do |i|
    value = arr[i]
    j = i - 1

    while j >= 0 && arr[j] > value
      arr[j+1] = arr[j]
      j -= 1
      @r_count += 1
    end

    arr[j+1] = value
  end
  arr
end

# result = rosetta_insertion_sort([5, 3, 2, 6, 1, 4])
# puts "result of rosetta_insertion_sort on 5 3 2 1 4 is #{result}"

# # Expect nil when empty array is passed in
# puts "Rosetta sort on empty array: #{rosetta_insertion_sort([]).inspect}"

# Benchmark.bm do |x|
#   x.report("Rosetta insertion sort:") {rosetta_insertion_sort(list)}
#   x.report("insertion sort:") {insertion_sort(list)}
#   x.report("bubble sort:") {bubble_sort(list)}
#   x.report("ruby sort:") {sort(list)}
# end

# Create a 10,000 element array, and map random numbers in it that range from 1 to 100,000
# 
list = Array.new(10_000).map { rand(100_000_000) }
insertion_sort(list)

list = Array.new(10_000).map { rand(100_000_000) }
rosetta_insertion_sort(list)

puts "Insert count is #{@i_count}"
puts "Rosetta count is #{@r_count}"




