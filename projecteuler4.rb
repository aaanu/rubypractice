# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 x 99
# Find the largest palindrome made from the product of two 3-digit numbers

# we are required to use arguments that are 3-digit numbers, so we set a range argument

module Euler4
  def self.compute(range)
    array = []
    range.each do |x| # iterate through given range
      x.upto(range.end) do |y| # upto: basically like += until the limit argument
        array.push(x * y) if palindrome?(x * y)
      end
    end
    array.max
  end

  def self.palindrome?(n) #we're given a number, so n for number
    n.to_s == n.to_s.reverse
  end
end

puts Euler4.compute(100..999) # answer returned is 906609
