def gaussian_elimination(matrix)
  n = matrix.size

  (0...n).each do |i|
    #search for maximum in this column
    max_row = i
    (i + 1...n).each { |j| max_row = j if matrix[j][i].abs > matrix[max_row][i].abs }

    #swap maximum row with current row (pivot)
    matrix[i], matrix[max_row] = matrix[max_row], matrix[i]

    #make all rows below this one 0 in current column
    (i + 1...n).each do |j|
      factor = matrix[j][i].to_f / matrix[i][i]
      (i...n + 1).each { |k| matrix[j][k] -= factor * matrix[i][k] }
    end
  end

  #back substitution
  x = Array.new(n)
  (n - 1).downto(0) do |i|
    x[i] = matrix[i][n].to_f / matrix[i][i]
    (0...i).each { |j| matrix[j][n] -= matrix[j][i] * x[i] }
  end

  x
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_f
end

puts "Enter the number of equations in the system:"
n = gets.chomp.to_i

puts "Enter the augmented matrix for the system of equations (each row as space-separated values):"
matrix = []
n.times do |i|
  row = gets.chomp.split.map(&:to_f)
  matrix << row
end

#perform Gaussian elimination
solution = gaussian_elimination(matrix)

puts "Solution to the system of equations:"
solution.each_with_index { |value, i| puts "x#{i + 1} = #{value}" }
