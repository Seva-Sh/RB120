# Class Definition -- Formal Essence

class Robot
  def initialize(name) # Constructor method: invoked whenever we instantiate a new object.
    @name = name       # Here, we define a 'name' attribute within the class
  end

  def talk             # Here, we define a 'talk' behavior within the class.
    puts "I'm a robot, and I can talk."
  end

  def name             # Here, we define a behavior corresponding to a getter mthod.
    @name              # The 'getting' behavior is a conringent property of the attribute.
  end

  def name=(name)      # Here, we define a behavior corresponding to a setter method.
    @name = name       # The 'setting' behavior is a conringent property of the attribute.
  end
end

# Object Instantiation -- Particular Existence

r2d2 = Robot.new("R2D2")
c3p0 = Robot.new("c3p0")