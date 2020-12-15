class Circle
  
  def initialize(x)
    @r = x
  end

  def self.info
    "This is a Circle class"
  end

  def area
    @r * @r * 3.141592
  end
end

p Circle.info
c = Circle.new(3)
p c.area