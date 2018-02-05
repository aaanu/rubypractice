# The largest prime factors of 13195 are 5,7,13, and 29.
# What is the largest prime factor of 600851475143 ?
require 'prime'

module Euler3
  def self.easy_compute
    return Prime.instance.prime_division(600851475143)
  end
end

puts Euler3.easy_compute
