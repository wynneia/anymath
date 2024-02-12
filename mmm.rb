def calculate_mean(numbers)
  sum = numbers.inject(0) { |acc, num| acc + num }
  sum.to_f / numbers.length
end

def calculate_median(numbers)
  sorted_numbers = numbers.sort
  n = sorted_numbers.length
  if n.odd?
    sorted_numbers[n / 2]
  else
    (sorted_numbers[n / 2 - 1] + sorted_numbers[n / 2]) / 2.0
  end
end

def calculate_mode(numbers)
  counts = Hash.new(0)
  numbers.each { |num| counts[num] += 1 }
  max_count = counts.values.max
  mode = counts.select { |_, count| count == max_count }.keys
  mode.length == numbers.uniq.length ? nil : mode
end

def get_user_input(prompt)
  print prompt
  gets.chomp.split.map(&:to_f)
end

numbers = get_user_input("Enter a list of numbers separated by spaces: ")

mean = calculate_mean(numbers)
median = calculate_median(numbers)
mode = calculate_mode(numbers)

puts "Mean: #{mean}"
puts "Median: #{median}"
puts "Mode: #{mode.nil? ? 'No mode' : mode.join(', ')}"
