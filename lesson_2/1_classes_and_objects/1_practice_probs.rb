# class Person
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

# end


# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

# --------------------------------------------

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name='', last_name='')
    @first_name = first_name
    @last_name = last_name
  end

  def name
    if self.last_name == ''
      return first_name
    else
      return [first_name, last_name].join(' ')
    end
  end

  def name=(full_name)
    names = full_name.split
    self.first_name = names[0]
    if names.size > 1
      self.last_name = names[1]
    end
  end

  def to_s
    name()
  end

end

bob = Person.new('Robert Smith')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'
# bob.name = "John "
# p bob.first_name
# p bob.last_name
# rob = Person.new('Robert Smith')
# p bob.name == rob.name
puts "The person's name is: #{bob}"