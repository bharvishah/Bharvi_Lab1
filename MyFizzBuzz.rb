#  p "Enter a number:"
# name = gets.chomp
# number = name.to_i

#(0..30).each do |num|
(0..30).each do |number|

  if (number % 3 == 0) && (number % 5 == 0)
  puts " #{number} is Fizz Buzz"
  elsif number % 3 == 0
    puts "#{number} is a Fizz"
  elsif number % 5 == 0
    puts "#{number} is a Buzz"
  else
    puts "none"
end
end
