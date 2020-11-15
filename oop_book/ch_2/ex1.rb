# Create a class called MyCar. When you initialize a new instance or object of 
# the class, allow the user to define some instance variables that tell us the 
# year, color, and model of the car. Create an instance variable that is set 
# to 0 during instantiation of the object to track the current speed of the car 
# as well. Create instance methods that allow the car to speed up, brake, and 
# shut the car off.

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y 
    @color = c  
    @model = m
    @speed = 0
  end

  def spray_paint
    puts "What color would you like for your car?"
    answer = gets.chomp
    self.color = answer
  end

  def speed_up(speed)
    @speed += speed 
    puts "You current speed is #{@speed}!"
  end

  def brake(speed)
    @speed -= speed 
    puts "Your current speed is #{@speed}!"
  end

  def shut_off
    @speed = 0
    puts "You shut your car off! And your speed is now #{@speed}"
  end

  def info
    puts "#{@model} is of year #{@year} and of color #{@color}. 
    Current speed is #{@speed}"
  end
  
end

mitsu = MyCar.new("2018", "Red", "Mitsubishi")
mitsu.spray_paint
mitsu.info

