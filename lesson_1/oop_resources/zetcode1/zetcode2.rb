class Circle
  @@PI = 3.141592

  def initialize
    @radius = 0
  end

  def set_radius(radius)
    @radius = radius
  end

  def area
    @radius * @radius * @@PI
  end
end

c = Circle.new
c.set_radius(5)
puts c.area