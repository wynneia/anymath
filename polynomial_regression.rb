def polynomial_regression(data_points, degree)
  n = data_points.size
  x_values = data_points.map { |point| point[0] }
  y_values = data_points.map { |point| point[1] }

  x_matrix = Array.new(n) { |i| Array.new(degree + 1) { |j| x_values[i]**j } }
  y_matrix = Matrix.column_vector(y_values)

  x_transpose_x = Matrix[*x_matrix].transpose * Matrix[*x_matrix]
  x_transpose_y = Matrix[*x_matrix].transpose * y_matrix

  coefficients = (x_transpose_x.inverse * x_transpose_y).column(0).to_a

  coefficients.reverse
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_f
end

puts "Enter the number of data points:"
num_points = gets.chomp.to_i

data_points = []
num_points.times do |i|
  x = get_user_input("Enter x-coordinate of data point #{i + 1}: ")
  y = get_user_input("Enter y-coordinate of data point #{i + 1}: ")
  data_points << [x, y]
end

puts "Enter the degree of the polynomial for regression:"
degree = gets.chomp.to_i

coefficients = polynomial_regression(data_points, degree)

puts "The coefficients of the polynomial fit:"
coefficients.each_with_index { |coef, i| puts "Coefficient for x^#{i}: #{coef}" }
