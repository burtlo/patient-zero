class ActionScene < GameScene

  event :on_hold, KbLeft, GpLeft do
    move_sprite_by(hero,Point.new(-hero.move_amount,0,0))
  end

  event :on_hold, KbRight, GpRight do
    move_sprite_by(hero,Point.new(hero.move_amount,0,0))
  end

  event :on_hold, KbUp, GpUp do
    move_sprite_by(hero,Point.new(0,-hero.move_amount,0))
  end

  event :on_hold, KbDown, GpDown do
    move_sprite_by(hero,Point.new(0,hero.move_amount,0))
  end

end