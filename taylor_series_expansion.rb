def calculate_e(n)
  e = 1.0
  factorial = 1

  (1..n).each do |i|
    factorial *= i
    e += 1.0 / factorial
  end

  e
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_i
end

terms = get_user_input("Enter the number of terms to use in the Taylor series expansion: ")

e_value = calculate_e(terms)

puts "The value of e (Euler's number) with #{terms} terms: #{e_value}"
