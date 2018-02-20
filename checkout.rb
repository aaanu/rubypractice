# Solution to http://codekata.com/kata/kata09-back-to-the-checkout/
# Implementing a supermarket with a checkout system
# where items have their unit price, and then a special price like "Apples cost 50 cents, three apples cost $1.30"

# Typically every discount is of the format "buy n for y cents"
# So we need a quantity and a special_price
class Discount
  def initialize(quantity, special_price)
    @quantity = quantity
    @special_price = special_price
  end

  def calculate(quantity)
    (quantity / @quantity).floor * @special_price
  end
end

# Our pricing_rules will be a hash where
# - key: the item/SKU name
# - value: PricePolicy
# PricePolicy contains
# - a unit price (required)
# - any # of discounts (optional)
# All prices are in cents
class PricePolicy
  def initialize(unit_price, *discounts)
    @unit_price = unit_price
    @discounts = discounts
  end

  def calculate_price(quantity)
    quantity * @unit_price - calculate_discount(quantity)
  end

  def calculate_discount(quantity)
    @discounts.inject(0) do |price, discount|
      price + discount.calculate(quantity)
    end
  end
end

pricing_rules = {
  'A' => PricePolicy.new(50, Discount.new(3,130)),
  'B' => PricePolicy.new(30, Discount.new(2,45)),
  'C' => PricePolicy.new(20),
  'D' => PricePolicy.new(15)
}

class Checkout
  def initialize(rules)
    @rules = rules
    @items = Hash.new
  end

  def scan(item)
    @items[item] ||= 0
    @items[item] += 1
  end

  def total
    @items.inject(0) do |price, (item, quantity)|
      price + calculate_special_price(item, quantity)
    end
  end

  private
  def calculate_special_price(item, quantity)
    if rule(item)
      rule(item).calculate_price(quantity)
    else
      raise "Invalid item '#{item}'"
    end
  end

  def rule(item)
    @rules[item]
  end
end

example_1 = Checkout.new(pricing_rules)
puts example_1.total # Should be 0 since no items scanned
example_1.scan("A")
puts example_1.total # Should be 50
example_1.scan("B")
puts example_1.total # Should be 80
example_1.scan("A")
puts example_1.total # Should be 130
example_1.scan("A")
puts example_1.total # Should be 160 ---------- this doesn't work
example_1.scan("B")
puts example_1.total # Should be 175
