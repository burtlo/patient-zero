class Hero < Metro::UI::Sprite

  property :image, path: "hero.png"

  property :move_amount, default: 1.5
  property :turn_amount, default: 90.0

  event :on_up, KbC do
    puts "Cough, Cough"
    puts "Creating cough"
    cough = create "cough", position: position, color: "rgba(255,255,255,0.3)"
    scene.add(cough)
  end

  event :on_hold, KbLeft, GpLeft do
    self.x -= move_amount
  end

  event :on_hold, KbRight, GpRight do
    self.x += move_amount
  end

  event :on_hold, KbUp, GpUp do
    self.y -= move_amount
  end

  event :on_hold, KbDown, GpDown do
    self.y += move_amount
  end

  event :on_up, KbSpace do
    self.angle += turn_amount
  end

end