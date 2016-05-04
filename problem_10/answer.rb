#!/usr/bin/env ruby

class PrimeNumberGenerator
  include Enumerable

  def each(&block)
    block.yield(2)
    next_prime = 3
    primes = []
    loop do
      if prime_number?(next_prime, primes)
        primes << next_prime
        block.yield(next_prime)
      end
      next_prime += 2
    end
  end

  def prime_number?(n, prev_primes)
    sqrt_n = Math.sqrt(n)
    ! prev_primes.take_while{ |i| i < sqrt_n }.any? { |i| (n % i).zero? }
  end
end

generator = PrimeNumberGenerator.new
puts generator.take_while { |prime| prime <= 2_000_000 }.inject(:+)

