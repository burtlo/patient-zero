class Cough < Metro::UI::Sprite

  property :image, path: "cough.png"

  property :current_power, default: 10
  property :max_power, default: 100.0
  property :power_rate, default: 1.0

  def completed?
    has_reached_max?
  end

  def has_reached_max?
    current_power >= max_power
  end

  def update
    super
    self.current_power += power_rate
    self.scale = Scale.to(2.0 * current_power/max_power,2.0 * current_power/max_power)
  end

  # @return [Float] the left-most x position of the sprite
  def left
    x - width * center_x * x_factor
  end

  # @return [Float] the top-most y position of the sprite
  def top
    y - height * center_y * y_factor
  end

end