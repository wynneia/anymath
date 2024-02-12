def custom_function(x)
   #you can customize this
  return x**2 - 4
end

def derivative(x)
  #you can define the derivative of your custom function here
  return 2 * x
end

def newton_raphson(initial_guess, tolerance, max_iterations)
  x = initial_guess
  iteration = 0

  loop do
    fx = custom_function(x)
    dfx = derivative(x)
    x_next = x - fx / dfx

    break if (x_next - x).abs < tolerance || iteration >= max_iterations

    x = x_next
    iteration += 1
  end

  return x
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_f
end

initial_guess = get_user_input("Enter initial guess: ")
tolerance = get_user_input("Enter tolerance: ")
max_iterations = get_user_input("Enter maximum number of iterations: ")

#perform root-finding using the Newton-Raphson method
result = newton_raphson(initial_guess, tolerance, max_iterations)

puts "Approximate root: #{result}"
