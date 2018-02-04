module Palindrome
  def self.is_palindrome?(word)
    if (word.is_a?(String))
      word.downcase == word.downcase.reverse
    else
      raise "Expected string value"
    end
  end
end

puts Palindrome.is_palindrome?('Deleveled')
puts Palindrome.is_palindrome?('KAyak')
puts Palindrome.is_palindrome?('dead')
puts Palindrome.is_palindrome?('hannah')
