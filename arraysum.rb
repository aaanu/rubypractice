# Given an array of integers and a target sum
# Return the pairs that add up to the target sum

module ArraySum

  def self.findPairs(numbers, target)
    solutions = Array.new
    if (numbers.empty? || numbers.length < 2)
      return solutions.to_s
    end

    solutions.push(numbers.combination(2).find_all { |x,y| x+y == target })
    # Doesn't work if given [2,2,2,2,2] => prints every combination that makes 4
    # Would have to mutate array to only return [2,2], [2,2]

    # Pretty print it as an array of arrays
    return solutions.map(&:to_s).join(", ")
  end

end

puts ArraySum.findPairs([1,2,3,4,5], 7) # Returns [[2,5], [3,4]]
puts ArraySum.findPairs([2,4,6,8], 6) # Returns [[2,4]]
puts ArraySum.findPairs([20, 30, 10], 0) # Returns []
puts ArraySum.findPairs([], 22) # Returns []
puts ArraySum.findPairs([2,2,2,2,2], 4) # SHOULD RETURN [[2,2], [2,2]]
puts ArraySum.findPairs([-10, -9, -8, -5, 2, 3, 5], -5) # Returns [[-10,5], [-8,3]]
