def sum_of_digits(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

def product_of_digits(number)
  number.to_s.chars.map(&:to_i).reduce(:*)
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_i
end

number = get_user_input("Enter a number: ")

sum = sum_of_digits(number)
product = product_of_digits(number)

puts "Sum of digits: #{sum}"
puts "Product of digits: #{product}"
