# Initialize the sum variable
sum = (1..100000000).inject(0) { |sum, i| sum + i }
puts "The sum of numbers from 1 to 100,000,000 is #{sum}"
