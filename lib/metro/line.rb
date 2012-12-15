class Metro::Units::Line

  attr_reader :a, :b

  def initialize(a,b)
    @a = a
    @b = b
  end

  def distance
    @distance ||= Math.hypot(a.x - b.x,a.y - b.y)
  end

  def slope
    @slope ||= (a.y - b.y) / (a.x - b.x)
  end

end