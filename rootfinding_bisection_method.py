def bisection_method(f, a, b, tolerance = 1e-6, max_iterations = 100)
  if f.call(a) * f.call(b) > 0
    puts "Error: The function does not have opposite signs at the endpoints."
    return nil
  end

  iteration = 0
  while (b - a).abs > tolerance && iteration < max_iterations
    c = (a + b) / 2.0
    if f.call(c) == 0
      return c
    elsif f.call(a) * f.call(c) < 0
      b = c
    else
      a = c
    end
    iteration += 1
  end

  (a + b) / 2.0
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_f
end

puts "Enter the function f(x) for which you want to find a root (e.g., 'x**2 - 4'):"
function_string = gets.chomp

puts "Enter the interval [a, b] for the bisection method:"
a = get_user_input("a: ")
b = get_user_input("b: ")

f = eval("->(x) { #{function_string} }")

root = bisection_method(f, a, b)

puts "The root of the function #{function_string} within the interval [#{a}, #{b}] is approximately: #{root}"
