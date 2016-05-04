#!/usr/bin/env ruby

class PrimeNumberGenerator
  include Enumerable

  def each(&block)
    next_prime = min_prime = 2
    primes = []
    loop do
      if prime_number?(next_prime, primes)
        primes << next_prime
        block.yield(next_prime)
      end
      next_prime += 1
    end
  end

  def prime_number?(n, prev_primes)
    ! prev_primes.any? { |i| (n % i).zero? }
  end
end

generator = PrimeNumberGenerator.new
puts generator.take(10001).last

