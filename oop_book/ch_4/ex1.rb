module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :year, :color, :model, :speed
  @@number_of_vehicles = 0

  def initialize(y, c, m)
    @year = y 
    @color = c  
    @model = m
    @speed = 0
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(liter, killometer)
    puts "#{killometer / liter} killometers per liter of gas"
  end

  def spray_paint(new_c)
    self.color = new_c
  end

  def current_speed
    puts "Your current speed is #{speed}"
  end

  def speed_up(speed)
    self.speed += speed 
    puts "You current speed is #{self.speed}!"
  end

  def brake(speed)
    self.speed -= speed 
    puts "Your current speed is #{self.speed}!"
  end

  def shut_down
    self.speed = 0
    puts "You shut your car off! And your speed is now #{self.speed}"
  end  

  def self.display_number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def age
    "Your #{self.model} is #{calc_age} years old."
  end

  private

  def calc_age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  
  def to_s
    "My car is a #{color}, #{year}, #{model}."
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{color}, #{year}, #{model}."
  end
end

# mitsu = MyCar.new("2018", "Red", "Mitsubishi Eclipse")
# my_truck = MyTruck.new("2010", "White", 'Ford Tundra')

# puts mitsu
# puts my_truck

# Vehicle.display_number_of_vehicles

# p my_truck.can_tow?(300)

# puts MyCar.ancestors
# p MyTruck.ancestors

# lumina = MyCar.new(1997, 'white', 'chevy lumina')
# lumina.speed_up(20)
# lumina.current_speed
# lumina.speed_up(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.brake(20)
# lumina.current_speed
# lumina.shut_down
# MyCar.gas_mileage(13, 351)
# lumina.spray_paint("red")
# puts lumina
# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vehicle.ancestors

# puts lumina.age

# --------------------------------------

class Student
  attr_accessor :name

  def initialize(name, grade)
    @name = name 
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new('joe', 5)
bob = Student.new('bob', 4)

puts "Well done!" if joe.better_grade_than?(bob)