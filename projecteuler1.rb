module Euler1
  def self.compute
    sum = 0
    for i in 1..333 do
      if 3*i % 5 == 0
        sum
      else
        sum += 3*i
      end
    end
    for j in 1..199 do
      sum += j*5
    end
    return sum
  end
end

puts Euler1.compute
