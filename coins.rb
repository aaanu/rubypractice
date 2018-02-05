# how many different ways can you make change for an amount, given a list of coins?
# ex: For amount = 4 and coin_list = {1,2,3}, there are four solutions: {1,1,1,1},{1,1,2},{2,2},{1,3}
# change([1,2,3], 4) => 4
# ex 2: change([2,5,3,6], 10) => 5

# things we can takeaway before beginning:
# - if amount = 0, # of solutions = 0. Same if coins is empty.
# need a counter for solutions

module Coins
  def self.change(coins, amount)
    solutions = Array.new(amount+1) { 0 }
    solutions[0] = 1

    coins.each{ |coin|
      for c in coin..amount do
        solutions[c] = solutions[c] + solutions[c - coin]
      end
    }
    return solutions[amount]
  end
end

puts Coins.change([1,2,3],4)
puts Coins.change([2,5,3,6],10)
