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

class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name
  attr_accessor :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end

class Shelter
  attr_accessor :shell

  def initialize
    @shell = {}
  end

  def adopt(person, animal)
    if @shell[person.name] == nil
      @shell[person.name] = [[animal.type, animal.name]]
      person.number_of_pets += 1
    else
      @shell[person.name] << [animal.type, animal.name]
      person.number_of_pets += 1
    end
  end

  def print_adoptions
    @shell.each do |person, animal|
      puts "#{person} has adopted the following pets:"
      animal.each do |animal|
        puts "a #{animal[0]} names #{animal[1]}"
      end
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)

shelter.adopt(phanson, pudding)

shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."