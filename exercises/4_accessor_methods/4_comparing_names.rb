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

class Person
  attr_writer :last_name
  attr_accessor :first_name

  def first_equals_last?
    first_name == last_name
  end

  private

  attr_reader :last_name
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?