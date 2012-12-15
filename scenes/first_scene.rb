class FirstScene < GameScene

  draw :hero, position: Game.center

  draw :person, position: (Game.center - Point.at(128,128))
  draw :person2, model: "Person", position: (Game.center - Point.at(18,128))

  draws :disease_control, :body_collision

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

  def move_sprite_by(body,point)
    new_bounds = body.bounds.shift(point)
    blocking = other_bodies(body).find {|body| body.bounds.intersect?(new_bounds) }
    if blocking
      puts "Blocked by #{blocking} #{blocking.bounds} vs #{new_bounds}"
    else
      puts "Moving body: #{body.position} by #{point}"
      body.position = body.position + point
    end
  end

  def bodies
    [ person, person2, hero ].find_all {|updater| updater.class.ancestors.include? Metro::UI::Sprite }
  end

  def other_bodies(body)
    bodies.reject {|b| b == body }
  end


  event :on_up, KbSpace do
    hero.angle += hero.turn_amount
  end


  def update
  end

end
