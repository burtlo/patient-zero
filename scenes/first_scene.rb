class FirstScene < GameScene

  draw :hero, position: Game.center

  draw :person, position: (Game.center - Point.at(128,128))
  draw :person2, model: "Person", position: (Game.center - Point.at(18,128))
  draw :person3, model: "Person", position: (Game.center - Point.at(-100,100))
  draw :person4, model: "Person", position: (Game.center - Point.at(-200,200))

  draw :map, model: "metro::ui::tile_map", file: "first.json", position: "0,0,-1"
  def viewport
    @viewport ||= Bounds.new left: 0, top: 0, right: 836, bottom: 608
  end
  
  def after_initialize
    map.viewport = viewport
  end
  

  draw :cough_virus

  draws :disease_control, :body_collision

  draw :reached_goal

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
    unless blocking
      # puts "Moving body: #{body.position} by #{point}"
      body.position = body.position + point
    end
  end

  def people
    updaters.find_all { |person| person.is_a? Person }
  end

  def bodies
    people + [hero]
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
