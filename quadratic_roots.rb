def quadratic_roots(a, b, c)
  discriminant = b**2 - 4 * a * c
  
  if discriminant > 0
    root1 = (-b + Math.sqrt(discriminant)) / (2 * a)
    root2 = (-b - Math.sqrt(discriminant)) / (2 * a)
    return root1, root2
  elsif discriminant == 0
    root = -b / (2 * a)
    return root
  else
    return "No real roots"
  end
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_f
end

puts "Enter the coefficients of the quadratic equation (ax^2 + bx + c):"
a = get_user_input("Enter coefficient a: ")
b = get_user_input("Enter coefficient b: ")
c = get_user_input("Enter coefficient c: ")

roots = quadratic_roots(a, b, c)

puts "Roots of the quadratic equation are: #{roots}"
