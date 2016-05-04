#!/usr/bin/env ruby
#
# @see https://projecteuler.net/problem=4
#   A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#   Find the largest palindrome made from the product of two 3-digit numbers.


class Factors
  include Comparable

  def initialize(*factors)
    @factors = factors
  end
  attr_reader :factors

  def value
    @value ||= @factors.inject(:*)
  end

  def <=>(another)
    value <=> another.value
  end

  def palindromic_number?
    @palindromic_number ||= value.palindromic_number?
  end
end

module FixnumHelper
  def palindromic_number?
    str_num = self.to_s
    digit = str_num.size
    half_pos = digit/2
    left = digit.odd? ? str_num[0...(half_pos - 1)] : str_num[0...half_pos]
    right = digit.odd? ? str_num[(half_pos + 1)..-1] : str_num[half_pos..-1]
    left == right.reverse
  end
end
Fixnum.prepend FixnumHelper

class PalindromicNumberGenerator
  include Enumerable

  def initialize(digit = 3)
    @digit = digit
    @max_factor = ('9' * @digit).to_i
    @min_factor = @max_factor / 10 + 1
    @start_num = @max_factor * @max_factor
  end

  def each(&block)
    one_side = @max_factor.downto(@min_factor).to_a
    one_side.product(one_side)
      .map{ |factors| Factors.new(*factors) }
      .select(&:palindromic_number?)
      .each do |n|
      block.yield(n)
    end
  end
end

generator = PalindromicNumberGenerator.new(3)
answer = generator.sort.reverse.first
puts "answer: #{answer.value} (#{answer.factors.join(' * ')})"

