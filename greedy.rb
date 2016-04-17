# User enters a dollar value float, for instance 10.25, and asks for change
# Greedy cashier needs to return the fewest possible 
# amount of coins

require 'active_support/inflector'

puts "Please enter an amount (for instance 10.75, .75, etc.)"
amount_entered = gets.to_f
change_cents = amount_entered * 100
coins = 0
quarters = 0
dimes = 0
nickels = 0
pennies = 0


while ( change_cents > 0 ) do
  
  if (change_cents >= 25) 
    coins = coins += 1
    quarters = quarters += 1
    change_cents -= 25

  elsif (change_cents >= 10) 
    coins = coins += 1
    dimes = dimes += 1
    change_cents -= 10

  elsif (change_cents >= 5) 
    coins = coins += 1
    nickels = nickels += 1
    change_cents -= 5
  
  else (change_cents >= 1) 
    coins = coins += 1
    pennies = pennies += 1
    change_cents -= 1
  end

end

puts "You received #{quarters} quarters, #{dimes} dimes, #{nickels} nickels, and #{pennies} pennies, for a total of #{coins} total coins"


# binding.pry
