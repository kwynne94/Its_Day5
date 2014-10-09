require './shipment'
require 'pry'

shipments = []

money = 0
fry_bonus = 0
amy_bonus = 0
bender_bonus = 0
leela_bonus = 0

open("planet_express_logs").each do |line|

  values_array = line.chomp.split(",")

  shipment = Shipment.new
  shipment.destination      = values_array[0]
  shipment.what_got_shipped = values_array[1]
  shipment.how_many         = values_array[2].to_i
  shipment.money            = values_array[3].to_i

  # binding.pry # => Stop here

  money += shipment.money

  case shipment.destination
  when "Earth"
    fry_bonus += shipment.money * 0.10
  when "Mars"
    amy_bonus += shipment.money * 0.10
  when "Uranus"
    bender_bonus += shipment.money * 0.10
  else
    leela_bonus += shipment.money * 0.10
  end

  shipments << shipment
end

puts "Show me all the earth"
earth = shipments.select do |shipment|
  shipment.destination == "Earth"
end
puts earth.inspect

puts "Show me all the moon"
moon = shipments.select do |shipment|
  shipment.destination == "Moon"
end
puts moon.inspect

puts "Show me all the mars"
mars = shipments.select do |shipment|
  shipment.destination == "Mars"
end
puts mars.inspect

puts "Show me all the uranus"
uranus = shipments.select do |shipment|
  shipment.destination == "Uranus"
end
puts uranus.inspect

puts "Show me all the jupiter"
jupiter = shipments.select do |shipment|
  shipment.destination == "Jupiter"
end
puts jupiter.inspect

puts "Show me all the saturn"
saturn = shipments.select do |shipment|
  shipment.destination == "Saturn"
end
puts saturn.inspect

puts "Show me all the mercury"
mercury = shipments.select do |shipment|
  shipment.destination == "Mercury"
end
puts mercury.inspect

puts "Show me all the pluto"
pluto = shipments.select do |shipment|
  shipment.destination == "Pluto"
end
puts pluto.inspect

puts "How much money did we make this week?"
puts "Money: #{money}"


puts "Fry: #{fry_bonus}"
puts "Amy: #{amy_bonus}"
puts "Bender: #{bender_bonus}"
puts "Leela: #{leela_bonus}"

puts "Shipments : #{shipments}"

pizza = shipments.select do |shipment|
  shipment.what_got_shipped == "Pizza"
end

puts "Total for pizza: #{pizza.map(&:money).inject(:+)}"


fry = shipments.select do |shipment|
  shipment.destination == "Earth"
end
