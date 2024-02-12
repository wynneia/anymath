require 'matrix'

def gauss_seidel(matrix, b, initial_guess, max_iterations = 100, tolerance = 1e-6)
  n = matrix.row_size
  x = Vector.elements(initial_guess)
  
  max_iterations.times do
    x_next = Vector.elements(Array.new(n) { |i| b[i] })
    n.times do |i|
      sum = matrix.row(i).each_with_index.reduce(0) do |acc, (element, j)|
        next acc if i == j
        acc + element * x_next[j]
      end
      x_next[i] = (b[i] - sum) / matrix[i, i].to_f
    end
    
    return x_next if (x_next - x).norm < tolerance
    x = x_next
  end
  
  raise "Gauss-Seidel method did not converge within #{max_iterations} iterations."
end

#example usage:
matrix = Matrix[
  [4, -1, 0],
  [-1, 4, -1],
  [0, -1, 3]
]
b = [5, 5, 0]
initial_guess = [0, 0, 0]

solution = gauss_seidel(matrix, b, initial_guess)

puts "Solution: #{solution}"
