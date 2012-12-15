class Metro::UI::Sprite

  def center
    center_width = (right - left)/2
    center_height = (bottom - top)/2
    Point.at(right + center_width, top + center_height)
  end

end