class Hero < Metro::UI::Sprite

  property :image, path: "hero.png"

  property :move_amount, default: 1.5

  event :on_up, KbC do
    puts "Cough, Cough"
    puts "Creating cough"
    cough = create "cough", position: position, color: "rgba(255,255,255,0.3)"
    scene.add(cough)
  end

end