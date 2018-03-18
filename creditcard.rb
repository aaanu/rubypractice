class CreditCard
  def initialize(limit, apr)
    @limit = limit
    @apr = apr.to_f
    @balance = 0
    # Need to keep track of outstanding balance for each day a transaction occurs
    # so we're recording two things: balance after a transaction, and days after opening of transaction
    @balance_activity = Array.new
    @transaction_days = Array.new
  end

  def swipe(amount, days_after_opening)
    # Don't let the swipe go through if it overdrafts
    # This isn't in the problem description but I figured this is what limit is used for, if anything
    if (@balance + amount <= @limit)
      @balance += amount
      @balance_activity.push(@balance)
      @transaction_days.push(days_after_opening)
    end
  end

  def pay(amount, days_after_opening)
    @balance -= amount
    @balance_activity.push(@balance)
    @transaction_days.push(days_after_opening)
  end

  # Returns total outstanding balance owed days_after_opening
  def calculate_balance(days_after_opening)
    if (days_after_opening < 30)
      return @balance
    else # For day 30, problem didn't specify what happens after day 30 period
      @transaction_days.push(30)
      accrued_interest = 0

      @balance_activity.each_with_index do |b, index|
        accrued_interest += (b * (@apr / 365) * (@transaction_days[index+1] - @transaction_days[index]))
      end

      return @balance + accrued_interest.round(2)
    end
  end
end

example1 = CreditCard.new(1000, 0.35)
example1.swipe(500, 0)
puts example1.calculate_balance(30) # Returns 514.38

example2 = CreditCard.new(1000, 0.35)
example2.swipe(500, 0)
# puts example2.calculate_balance(0) # These are to show that interest is not accrued before day 30
example2.pay(200, 15)
# puts example2.calculate_balance(15)
example2.swipe(100, 25)
# puts example2.calculate_balance(25)
puts example2.calculate_balance(30) # Returns 411.99

example3 = CreditCard.new(1000, 0.35) # No transactions happen in this example
puts example3.calculate_balance(30) # Returns 0.0
