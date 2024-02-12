def matrix_multiply(matrix1, matrix2)
  result = Array.new(matrix1.size) { Array.new(matrix2[0].size, 0) }

  matrix1.each_with_index do |row1, i|
    matrix2[0].size.times do |j|
      matrix2.size.times do |k|
        result[i][j] += matrix1[i][k] * matrix2[k][j]
      end
    end
  end

  result
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_i
end

puts "Enter the dimensions of the first matrix (rows and columns):"
rows1 = get_user_input("Rows: ")
columns1 = get_user_input("Columns: ")

puts "Enter the dimensions of the second matrix (rows and columns):"
rows2 = get_user_input("Rows: ")
columns2 = get_user_input("Columns: ")

matrix1 = Array.new(rows1) { Array.new(columns1) }
matrix2 = Array.new(rows2) { Array.new(columns2) }

puts "Enter the elements of the first matrix:"
rows1.times do |i|
  columns1.times do |j|
    matrix1[i][j] = get_user_input("Enter element at position (#{i + 1}, #{j + 1}): ")
  end
end

puts "Enter the elements of the second matrix:"
rows2.times do |i|
  columns2.times do |j|
    matrix2[i][j] = get_user_input("Enter element at position (#{i + 1}, #{j + 1}): ")
  end
end

result = matrix_multiply(matrix1, matrix2)

puts "Result of matrix multiplication:"
result.each { |row| puts row.join(" ") }
