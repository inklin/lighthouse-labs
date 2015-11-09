CAP_TO_REDEEM = 4
BOTTLE_TO_REDEEM = 2
BOTTLE_COST = 2

@total_bottles = 0 
@bottles = 0
@caps = 0

def buy_bottles(investment)
  bought_bottles = investment / BOTTLE_COST
  @total_bottles = bought_bottles
  @bottles = bought_bottles
  @caps = bought_bottles
  @free_from_caps = 0
  @free_from_bottles = 0

  redeem
  show_stats(investment, bought_bottles)
end

def show_stats(investment, bought_bottles)
  puts "Money spent: $#{investment}"
  puts "Bottles purchased: #{bought_bottles}"
  puts "Free bottles from bottle recycling: #{@free_from_bottles}"
  puts "Free bottles from cap recycling: #{@free_from_caps}"
  puts "Total bottles of pop: #{@total_bottles}"
  puts "Left over caps: #{@caps}"
  puts "Left over bottles: #{@bottles}"
end

def give_bottles_and_caps(bottles, caps)
  from_bottles = bottles / BOTTLE_TO_REDEEM
  from_caps = caps / CAP_TO_REDEEM
  update_freebies(from_bottles, from_caps)
  from_bottles + from_caps
end

def update_freebies(from_bottles, from_caps)
  @free_from_bottles += from_bottles
  @free_from_caps += from_caps
end

def change_for_bottles(bottles)
  bottles % BOTTLE_TO_REDEEM
end

def change_for_caps(caps)
  caps % CAP_TO_REDEEM
end

def redeem
  new_bottles = give_bottles_and_caps(@bottles, @caps)
  @bottles = new_bottles + change_for_bottles(@bottles)
  @caps = new_bottles + change_for_caps(@caps)
  @total_bottles += new_bottles
  redeem if can_redeem?
end

def can_redeem?
  @bottles >= BOTTLE_TO_REDEEM || @caps >= CAP_TO_REDEEM
end

def run_bottle_info
  loop do
    print "How much do you want to spend on pop? >> "
    answer = gets.chomp
    break if answer.include?('quit')
    dollar_amount = answer.to_i
    buy_bottles(dollar_amount)
  end
end

run_bottle_info