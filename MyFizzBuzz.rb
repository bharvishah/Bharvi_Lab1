# Fizz Buzz

# If a number is divisible by 3... output 'Fizz'
# If a number is divisible by 5... output 'Buzz'
# So numbers like 15 that are divisible by 3 AND 5 should output 'FizzBuzz'

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
