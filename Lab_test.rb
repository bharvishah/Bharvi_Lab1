# Record format
# Destination, What got shipped, Number of crates, Money we made

# Good news Rubyists!
# We have a week of records tracking what we shipped at Planet Express.
# I need you to answer a few questions for Hermes.

# How much money did we make this week?

# Also, bonuses are paid to employees who pilot the Planet Express
# Different employees have favorite destinations they always pilot to
# Fry - pilots to Earth (because he isn't allowed into space)
# Amy - pilots to Mars (so she can visit her family)
# Bender - pilots to Uranus (teeheee...)
# Leela - pilots everywhere else because she is the only responsible one

# How many trips did each employee pilot?
# They get a bonus of 10% of the money for the shipment as the bonus
# How much of a bonus did each employee get?

# BONUS 1
# How much money did we make broken down by planet?
# ie.. how much did we make shipping to Earth? Mars? Saturn? etc.

# BONUS 2 - uses classes for each shipment; but not necessary

array1 = []
# This creates an array of arrays of the records
open("planet_express_logs").each do |line|
  array1 << line.chomp.split(',')
end

# Now we create an array hash_record[] of hashes and assign [key,value] to the hashes
hash_record = []

array1.each do |entry|
entry.each_slice(4) do |value|

  hash_record << {:destination => value[0], :item_to_ship => value[1], :quant => value[2].to_i, :money_made => value[3].to_i}

# depending on the condition of the value of destination, we append new key-value pairs to the array hash_record
  case value[0]
  when "Earth"
    hash_record[-1][:pilot] = "Fry"
    hash_record[-1][:pilot_bonus] = (value[3].to_i) * 0.1
    when "Mars"
    hash_record[-1][:pilot] = "Amy"
    hash_record[-1][:pilot_bonus] = (value[3].to_i) * 0.1
    when "Uranus"
    hash_record[-1][:pilot] = "Bender"
    hash_record[-1][:pilot_bonus] = (value[3].to_i) * 0.1
    else
    hash_record[-1][:pilot] = "Leela"
    hash_record[-1][:pilot_bonus] = (value[3].to_i) * 0.1
  end

end
end


#p hash_record

#We populate the answers based on conditions and calculations in form of hash[key,values]
pilot_trips = {}
pilot_bonus = {}
total_money_made = 0
hash_record.each do |hash|
  total_money_made = total_money_made + hash[:money_made].to_i
  if pilot_trips[hash[:pilot]]
    pilot_trips[hash[:pilot]] += 1
  else
    pilot_trips[hash[:pilot]] = 1
end
if pilot_bonus[hash[:pilot]]
  pilot_bonus[hash[:pilot]] += hash[:pilot_bonus]
else
  pilot_bonus[hash[:pilot]] = hash[:pilot_bonus]
end

end

p "Total money made on all shipments: #{total_money_made}"

p "Trips made by each pilot : "
p pilot_trips
p "Bonus each pilot recieves : "
p pilot_bonus
