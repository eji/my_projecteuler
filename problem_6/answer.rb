#!/usr/bin/env ruby

max = 100
puts ( (1..max).map{ |n| n**2 }.inject(:+) - (1..max).inject(:+)**2 ).abs

