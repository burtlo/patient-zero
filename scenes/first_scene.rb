class FirstScene < GameScene

  draw :hero, position: Game.center
  
  draw :person, position: (Game.center - Point.at(128,128))

  draws :disease_control, :body_collision

  event :on_hold, KbLeft, GpLeft do
    hero.x -= hero.move_amount
  end

  event :on_hold, KbRight, GpRight do
    hero.x += hero.move_amount
  end

  event :on_hold, KbUp, GpUp do
    hero.y -= hero.move_amount
  end

  event :on_hold, KbDown, GpDown do
    hero.y += hero.move_amount
  end

  event :on_up, KbSpace do
    hero.angle += hero.turn_amount
  end


  def update
  end

end
