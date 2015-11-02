@total_bottles = 0 
@bottles = 0
@caps = 0
@bottle_free = 0
@cap_free = 0
CAP_TO_REDEEM = 4
BOTTLE_TO_REDEEM = 2

# buy bottles, start redeeming until can no longer redeem
def buy_bottles(investment)
  bottle_cost = 2
  bought_bottles = (investment / bottle_cost).floor
  @total_bottles = bought_bottles
  @bottles = bought_bottles
  @caps = bought_bottles
  @bottle_free = 0
  @cap_free = 0

  while can_redeem?
    redeem
  end

  show_stats(investment, bought_bottles)
end

def show_stats(investment, bought_bottles)
  puts "Money spent: $#{investment}"
  puts "Bottles purchased: #{bought_bottles}"
  puts "Bottles obtained through bottle recycling: #{@bottle_free}"
  puts "Bottles obtained through cap recycling: #{@cap_free}"
  puts "Total bottles of pop: #{@total_bottles}"
  puts "Left over caps: #{@caps}"
  puts "Left over bottles: #{@bottles}"
end


def redeem
    # get freebies from bottles
    freebies_from_bottles = @bottles / BOTTLE_TO_REDEEM
    # update total freebies from bottles
    @bottle_free += freebies_from_bottles


    freebies_from_caps = @caps / CAP_TO_REDEEM
    # update total freebies from caps
    @cap_free += freebies_from_caps

    # get total free bottles
    free_from_both = freebies_from_caps + freebies_from_bottles

    # get remaining caps
    @caps = @caps % CAP_TO_REDEEM
    # get remaining bottles
    @bottles = @bottles % BOTTLE_TO_REDEEM

    # get bottles and caps from new pops
    @bottles += free_from_both
    @caps += free_from_both
    @total_bottles += free_from_both
end

def can_redeem?
  @bottles >= BOTTLE_TO_REDEEM || @caps >= CAP_TO_REDEEM
end

def run_bottle_info
  done = false

  until done do
    print "How much do you want to spend on pop? >> "
    answer = gets.chomp

    if answer.include?('quit')
      exit(0)
    else
      buy_bottles(answer.to_i)
    end
  end
end

run_bottle_info
