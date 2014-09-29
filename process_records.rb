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

# class shipment
#   @planet, @item, @quantity, @money, @pilot
#
# end

#entries = []

class Shipment

  attr_accessor :planet, :item, :quantity, :money, :pilot, :bonus

  def initialize(planet,item,quantity,money)
    @planet = planet
    @item = item
    @quantity = quantity.to_i
    @money = money.to_i
    @pilot = ""
    @bonus = 0
  end
end


# Make an empty array of classes
$shipments = []
open("planet_express_logs").each do |line|

  s = Shipment.new(*line.chomp.split(','))

  $shipments << s

end

$shipments.each do |ship|

  case ship.planet
  when "Earth"
    ship.pilot = "Fry"
    ship.bonus = ship.money * 0.1
  when "Mars"
    ship.pilot = "Amy"
    ship.bonus = ship.money * 0.1
  when "Uranus"
    ship.pilot = "Bender"
    ship.bonus = ship.money * 0.1
  else
    ship.pilot = "Leela"
    ship.bonus = ship.money * 0.1
  end

end


def get_money_made
  total_money = 0
  $shipments.each do |ship|
    total_money += ship.money
  end
  return total_money
end




def get_pilot_trips
  pilot_trips = {}
  $shipments.each do |ship|
    if pilot_trips[ship.pilot]
      pilot_trips[ship.pilot] += 1
    else
      pilot_trips[ship.pilot] = 1
    end
  end
  return pilot_trips
end


def get_pilot_bonus
  pilot_bonus = {}
  $shipments.each do |ship|
    if pilot_bonus[ship.pilot]
      pilot_bonus[ship.pilot] += ship.bonus
    else
      pilot_bonus[ship.pilot] = ship.bonus
    end
  end
  return pilot_bonus
end




def get_money_by_planet
  planet_money = {}
  $shipments.each do |ship|
    if planet_money[ship.planet]
      planet_money[ship.planet] += ship.money
    else
      planet_money[ship.planet] = ship.money
    end
  end
  return planet_money
end
p "Total money made : #{get_money_made}"

p "Bonus each pilot gets : "
p get_pilot_bonus
p "Money made from each planet: "
p get_money_by_planet
