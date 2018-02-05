module Euler2

  # reusing old fibonacci code
  @cache = {}
  def self.fibonacci(n)
    if n <= 1
      return n
    else
      @cache[n] ||= fibonacci(n-1) + fibonacci(n-2)
    end
  end

  def self.compute_range
    i = 0
    counter = 0
    while i < 4000000 do
      i = fibonacci(counter)
      counter+=1
    end
    return counter
  end

  def self.compute
    end_range = compute_range
    sum = 0
    fibonacci_term = 0
    for i in 1..end_range do
      fibonacci_term = fibonacci(i)
      if fibonacci_term % 2 == 0
        sum += fibonacci_term
      else
        sum
      end
    end
    return sum
  end
end

puts Euler2.compute
