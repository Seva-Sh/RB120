=begin 

Problem:
- 
-
- 

Input: 
Output: 

Algorithm:
- 
-
-

=end

class Transform
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def uppercase
    @word.upcase
  end

  def self.lowercase(new_word)
    new_word.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')