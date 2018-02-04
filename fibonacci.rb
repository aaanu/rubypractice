# Write a method fib that takes an integer n and returns the nth fibonacci number

module Fibonacci
  def self.slow_compute(n)
    return n if n <= 1
    slow_compute(n-1) + slow_compute(n-2)
  end

  @cache = {}
  def self.compute(n)
    if n <= 1
      return n
    else
      @cache[n] ||= compute(n-1) + compute(n-2) # using double-pipe equals so if n is <= 1 (not nil), it won't change its value
    end
  end
end

# 0 1 1 2 3 5 8 13 21 34
puts Fibonacci.slow_compute(0) # 0
puts Fibonacci.slow_compute(1) # 1
puts Fibonacci.slow_compute(2) # 1
puts Fibonacci.slow_compute(3) # 2

puts Fibonacci.compute(100) # 354224848179261915075
