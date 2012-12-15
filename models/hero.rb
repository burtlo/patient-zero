class Hero < Metro::UI::AnimatedSprite
  property :animation, path: "hero-animated.png",
    dimensions: Dimensions.of(32,32), time_per_image: 200

  property :move_amount, default: 1.5

  property :energy, default: 100
  property :cough_energy_cost, default: 5

  event :on_up, KbC do

    if has_enough_energy_for_a_cough?
      self.energy -= cough_energy_cost
      puts "Cough, Cough"
      cough = create "cough", position: position, color: "rgba(255,255,255,0.3)"
      scene.add(cough)
    else
      puts "I'm too weak"
    end
  end

  def has_enough_energy_for_a_cough?
    energy >= cough_energy_cost
  end

end