# PHASE 2
def convert_to_int(str)
  begin
    input = Integer(str)
  rescue StandardError
    puts "Please enter a valid integer between 0 and 9"
  ensure
    p input ||= nil
  end
end

# PHASE 3

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin 
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError
    if maybe_fruit == "coffee"
      retry
    end
  end
end  

# PHASE 4

# rescue ArgumentError => e
#   puts "Couldn't take the square root of #{num}"
#   puts "Error was: #{e.message}"

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known.to_i < 5
      raise ArgumentError.new("We're only best friends if we've known each other for 5 years!")
    end
    if name.empty?
      raise ArgumentError.new("'name' cannot be blank")
    end
    if fav_pastime.empty?
      raise ArgumentError.new("'fav_pasttime' cannot be blank")
    end

    @name = name
    @yrs_known = yrs_known.to_i
    @fav_pastime = fav_pastime
  end


  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end
