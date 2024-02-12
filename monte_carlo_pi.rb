def monte_carlo_pi(num_points)
  points_inside_circle = 0

  num_points.times do
    x = rand
    y = rand
    distance = Math.sqrt(x**2 + y**2)
    points_inside_circle += 1 if distance <= 1
  end

  4 * points_inside_circle.to_f / num_points
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_i
end

puts "Enter the number of points to use in the Monte Carlo simulation:"
num_points = get_user_input("Number of points: ")

pi_estimate = monte_carlo_pi(num_points)

puts "The estimated value of π using Monte Carlo simulation with #{num_points} points is approximately: #{pi_estimate}"
