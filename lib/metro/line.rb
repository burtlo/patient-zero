class Metro::Units::Line

  def self.slope_components(a,b)
    Metro::Units::Point.at (a.x - b.x), (a.y - b.y)
  end

  def self.slope(a,b)
    (a.y - b.y) / (a.x - b.x)
  end

end