# Given a string of numbers, like "1, 3-5, 7, 9",
# This method will return an array of the numbers represented
# We're assuming that all strings inputted will be properly formatted (i.e. only use "-" and ",")
# We're assuming that ranges will be from lowNumber - highNumber, i.e. no case of "5-2"
# This solution works for only single-digit negative numbers, i.e. no negatives less than -9

def toArray(numbers)
  numArray = Array.new
  numbers.delete(" ")
  if numbers.length == 0
    return numArray
  end
  numbers.split(",").each do |str|
    if str.length < 3
      numArray.push(str.to_i)
    else
      rangeArray = str.split("-").map(&:to_i)
      (rangeArray[0]..rangeArray[1]).each do |n|
          numArray.push(n)
      end
    end
  end
  return numArray
end

puts toArray("1, 3-5, 7, 9").map(&:to_s).join(", ") # Returns [1,3,4,5,7,9]
puts toArray("1").map(&:to_s).join(", ") # Returns [1]
puts toArray("-1,2,-3").map(&:to_s).join(", ") # Returns [-1,2,-3]
puts toArray("").map(&:to_s).join(", ") # Returns []
puts toArray("5-10").map(&:to_s).join(", ") # Returns [5,6,7,8,9,10]
