require 'matrix'

def levenberg_marquardt(x_data, y_data, initial_guess, func, jacobian, lambda: 0.01, tolerance: 1e-6, max_iterations: 100)
  parameters = Vector.elements(initial_guess)
  residual = Vector.elements(y_data.map.with_index { |y, i| y - func.call(x_data[i], parameters.to_a) })

  iteration = 0
  while iteration < max_iterations
    jacobian_matrix = Matrix.rows(y_data.map.with_index { |_, i| jacobian.call(x_data[i], parameters.to_a) })
    jacobian_transpose = jacobian_matrix.transpose

    squared_residual = residual.map { |r| r**2 }
    sum_squared_residual = squared_residual.reduce(:+)

    jacobian_squared_residual = jacobian_matrix.transpose * squared_residual
    sum_jacobian_squared_residual = jacobian_squared_residual.reduce(:+)

    jacobian_squared = jacobian_transpose * jacobian_matrix
    diagonal = Matrix.diagonal(*((1 + lambda) * jacobian_squared.to_a.map(&:first)))

    delta_parameters = (jacobian_squared + diagonal).inverse * jacobian_transpose * residual

    new_parameters = parameters + delta_parameters

    new_residual = Vector.elements(y_data.map.with_index { |y, i| y - func.call(x_data[i], new_parameters.to_a) })
    new_squared_residual = new_residual.map { |r| r**2 }
    new_sum_squared_residual = new_squared_residual.reduce(:+)

    if new_sum_squared_residual < sum_squared_residual
      lambda /= 10
      parameters = new_parameters
      residual = new_residual
    else
      lambda *= 10
    end

    break if delta_parameters.norm < tolerance

    iteration += 1
  end

  parameters.to_a
end

#example usage:
x_data = [0, 1, 2, 3, 4, 5]
y_data = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6]

#define the model function and its Jacobian
func = ->(x, parameters) { parameters[0] * Math.exp(parameters[1] * x) }
jacobian = ->(x, parameters) { [Math.exp(parameters[1] * x), parameters[0] * x * Math.exp(parameters[1] * x)] }

#initial guess for parameters
initial_guess = [1.0, 0.1]

#run the Levenberg-Marquardt algorithm
parameters = levenberg_marquardt(x_data, y_data, initial_guess, func, jacobian)

puts "Optimal parameters: #{parameters}"
