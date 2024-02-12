def custom_function(x)
   #you can change this
  return Math.sin(x) + x**2
end

def trapezoidal_rule(a, b, n)
  h = (b - a).to_f / n
  sum = 0.5 * (custom_function(a) + custom_function(b))
  (1..n-1).each do |i|
    sum += custom_function(a + i * h)
  end
  sum * h
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_f
end

#get user inputs
a = get_user_input("Enter the lower limit of integration: ")
b = get_user_input("Enter the upper limit of integration: ")
n = get_user_input("Enter the number of intervals (more intervals for better accuracy): ")

#calculate the integral using the trapezoidal rule
result = trapezoidal_rule(a, b, n)

puts "Approximate integral: #{result}"
