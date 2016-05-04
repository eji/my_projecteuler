#!/usr/bin/env ruby

def pythagoras_number?(a, b, c)
  a < b&&
    b < c &&
    c ** 2 == a ** 2 + b ** 2
end

(1..1000).each do |c|
  (1...c).each do |b|
    (1...b).each do |a|
      if pythagoras_number?(a, b, c) && (a + b + c) == 1000
        ans = a * b * c
        puts ans
        exit
      end
    end
  end
end

