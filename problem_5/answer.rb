#!/usr/bin/env ruby

def divisors(n)
  (2..n).select{ |i| (n % i).zero? }
end

def common_divisors(*numbers)
  numbers.map{ |n| divisors(n) }.inject(:&)
end

def lcm(numbers)
  divs = [1]
  current_nums = numbers
  loop do
    common_divs = current_nums.combination(2).map{ |pair| common_divisors(*pair) }.reject(&:empty?).map(&:first).sort

    break if common_divs.empty?

    min_div = common_divs.first
    current_nums = current_nums.map do |n|
      if (n % min_div).zero?
        n / min_div
      else
        n
      end
    end
    divs << min_div
  end
  current_nums.inject(:*) * divs.inject(:*)
end

puts lcm((1..20).to_a)

