module Euler5
  def self.compute
    lcm = (1..20).inject do |x,y|
      x.lcm(y)
    end
    return lcm
  end
end

puts Euler5.compute
