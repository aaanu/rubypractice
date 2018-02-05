# Given a phrase, checks if all letters of the alphabet are present in the phrase.
# ruby makes this easy! :)s

module Alphabet
  def self.all_letters_present?(phrase)
    ("a".."z").all?{ |c| phrase.downcase.count(c) >= 1 } #check if it shows up at least once
  end
end

puts Alphabet.all_letters_present?("abc")
puts Alphabet.all_letters_present?("abcdefghijklmnopqrstuvwxyz")
puts Alphabet.all_letters_present?("Pack my box with five dozen liquor jugs")
puts Alphabet.all_letters_present?("This phrase doesn't use every letter of the alphabet.")
puts Alphabet.all_letters_present?("")
