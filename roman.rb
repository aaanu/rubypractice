module Roman
  ROMAN_NUMBERS = {
    1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I",
  }

  def self.convert(n)
    roman = ""
    ROMAN_NUMBERS.each do |value, letter|
      roman << letter*(n / value)
      n = n % value
    end
    return roman
  end
end

puts Roman.convert(4)
puts Roman.convert(9)
puts Roman.convert(15)
puts Roman.convert(3)
puts Roman.convert(49)
