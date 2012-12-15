class Metro::Units::RectangleBounds

  def shift(point)
    self.class.new left: (left + point.x), right: (right + point.x),
      top: (top + point.y), bottom: (bottom + point.y)
  end

end