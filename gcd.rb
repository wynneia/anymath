def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  return a
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_i
end

number1 = get_user_input("Enter the first number: ")
number2 = get_user_input("Enter the second number: ")

result = gcd(number1, number2)

puts "The greatest common divisor of #{number1} and #{number2} is #{result}."
