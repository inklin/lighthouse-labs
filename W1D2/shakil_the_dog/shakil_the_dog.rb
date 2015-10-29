# Save this file to your computer so you can run it 
# via the command line (Terminal) like so:
#   $ ruby shakil_the_dog.rb
def shakil_the_dog
  in_room = true

  while in_room
    speech = gets.chomp

    if said_go_away(speech)
      in_room = false
    else
      puts get_response(speech)
    end
  end
end

def get_response(spoken)
  response = ""
  return response if no_response(spoken)

  case spoken

  when "woof"
    response = "WOOF WOOF WOOF"
  when "meow"
    response = "woof woof woof woof woof"
  else
    response = "woof"
  end

  response
end

def no_response(spoken)
  said_stop(spoken) || said_treat(spoken)
end

def said_stop(spoken)
  spoken_words = spoken.downcase.gsub(/\W+/, ' ').split(' ')
  spoken_words.include?('shakil') && spoken_words.include?('stop')
end

def said_treat(spoken)
  spoken.split(' ').include?('treat')
end

def said_go_away(spoken)
  spoken == "go away"
end
 
shakil_the_dog