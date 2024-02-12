def midpoint_rule(func, a, b, n)
  h = (b - a) / n.to_f
  sum = 0.0

  (0..(n-1)).each do |i|
    x_i = a + (i + 0.5) * h
    sum += func.call(x_i)
  end

  sum *= h
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_f
end

puts "Enter the function f(x) for which you want to perform numerical integration (e.g., 'Math.sin(x)'):"
function_string = gets.chomp

puts "Enter the lower limit of integration (a):"
a = get_user_input("a: ")

puts "Enter the upper limit of integration (b):"
b = get_user_input("b: ")

puts "Enter the number of intervals (n):"
n = gets.chomp.to_i

func = eval("->(x) { #{function_string} }")

integral = midpoint_rule(func, a, b, n)

puts "The value of the integral of #{function_string} from #{a} to #{b} using the midpoint rule is approximately: #{integral}"
