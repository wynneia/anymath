def sieve_of_eratosthenes(limit)
  primes = []
  sieve = Array.new(limit + 1, true)
  sieve[0] = sieve[1] = false

  (2..Math.sqrt(limit)).each do |i|
    next unless sieve[i]

    (i * i).step(limit, i) do |j|
      sieve[j] = false
    end
  end

  sieve.each_with_index { |is_prime, num| primes << num if is_prime }
  primes
end

def get_user_input(prompt)
  print prompt
  gets.chomp.to_i
end

limit = get_user_input("Enter the limit to find all primes up to: ")

prime_numbers = sieve_of_eratosthenes(limit)

puts "Prime numbers up to #{limit}: #{prime_numbers.join(', ')}"
