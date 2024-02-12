def custom_function(x)
   #you can change this or make user input custom
  return Math.sin(x) + x**2
end

def central_difference(x, h)
  (custom_function(x + h) - custom_function(x - h)) / (2 * h)
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_f
end

#get user inputs
x = get_user_input("Enter the value of x: ")
h = get_user_input("Enter the step size (h) for numerical approximation: ")

#calculate the derivative using the central difference method
result = central_difference(x, h)

puts "Approximate derivative at x = #{x}: #{result}"
