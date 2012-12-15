class Metro::UI::Sprite

  property :bounding_box, type: :model do
    create "metro::ui::border", color: "rgb(255,0,0)", position: Point.at(left,top),
      dimensions: Dimensions.of(right - left,bottom - top)
  end

  def update
    bounding_box.position = Point.at(left,top)
    bounding_box.dimensions = Dimensions.of(right - left,bottom - top)
  end

  def draw
    image.draw_rot x, y, z_order, angle, center_x, center_y, x_factor, y_factor, color
    bounding_box.draw
  end

  def center
    center_width = (right - left)/2
    center_height = (bottom - top)/2
    Point.at(right + center_width, top + center_height)
  end

end