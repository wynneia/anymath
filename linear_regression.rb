def linear_regression(x_values, y_values)
  n = x_values.length
  sum_x = x_values.reduce(:+)
  sum_y = y_values.reduce(:+)
  sum_x_squared = x_values.map { |x| x**2 }.reduce(:+)
  sum_xy = x_values.zip(y_values).map { |x, y| x * y }.reduce(:+)

  slope = (n * sum_xy - sum_x * sum_y) / (n * sum_x_squared - sum_x**2)
  intercept = (sum_y - slope * sum_x) / n

  return slope, intercept
end

def get_user_input(prompt)
  print prompt
  gets.chomp.split.map(&:to_f)
end

puts "Enter the data points as space-separated pairs of x and y values (e.g., 'x1 y1 x2 y2 ...'):"
x_values, y_values = get_user_input("Data points: ")

slope, intercept = linear_regression(x_values, y_values)

puts "Equation of the line: y = #{slope}x + #{intercept}"
