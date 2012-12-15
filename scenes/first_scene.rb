class FirstScene < GameScene

  draw :hero, position: "400,300"

  draw :person, position: (Game.center - Point.at(78,128))
  draw :person2, model: "Person", position: (Game.center - Point.at(-56,128))
  draw :person3, model: "Person", position: (Game.center - Point.at(0,150))
  draw :person4, model: "Person", position: (Game.center - Point.at(-100,200))

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

  draws :body_collision

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
    body_collision.move_sprite_by(body,point)
  end


  event :on_up, KbSpace do
    hero.angle += hero.turn_amount
  end


  def update
  end

end
