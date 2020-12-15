str1 = "something"
str2 = "something"
str1 == str2            # => true

int1 = 1
int2 = 1
int1 == int2            # => true

sym1 = :something
sym2 = :something
sym1 == sym2            # => true

# ------------------------------------

str1 = "something"
str2 = "something"
str1_copy = str1

# comparing the string objects' values
str1 == str2            # => true
str1 == str1_copy       # => true
str2 == str1_copy       # => true

# comparing the actual objects
str1.equal? str2        # => false
str1.equal? str1_copy   # => true
str2.equal? str1_copy   # => false

# ------------------------------------

class Person
  attr_accessor :name

  def ==(other)
    name == other.name  #relying on String#== here
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

p bob == bob2

bob_copy = bob
p bob == bob_copy

#--------------------------------

str1 = "something"
str2 = "something"

str1.object_id            # => 70186013144280
str2.object_id            # => 70186013536580

arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id      # => false

sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id      # => true

int1 = 5
int2 = 5
int1.object_id == int2.object_id      # => true