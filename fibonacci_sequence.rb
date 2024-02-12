def fibonacci(n)
  fibonacci_sequence = [0, 1]

  (2..n).each do |i|
    fibonacci_sequence << fibonacci_sequence[i - 1] + fibonacci_sequence[i - 2]
  end

  return fibonacci_sequence[0..n]
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_i
end

number_of_terms = get_user_input("Enter the number of Fibonacci terms to generate: ")

fibonacci_sequence = fibonacci(number_of_terms - 1) # Adjusting for zero-based index

puts "Fibonacci sequence up to #{number_of_terms} terms: #{fibonacci_sequence.join(', ')}"
