class FirstScene < GameScene

  draw :fps, model: "metro::ui::fps", placement: 'bottom_right'

  draw :energy, position: Point.at(20,20,15), dimensions: Dimensions.of(100,20)

  # draw :person, position: (Game.center - Point.at(78,128))
  # draw :person2, model: "Person", position: (Game.center - Point.at(-56,128))
  # draw :person3, model: "Person", position: (Game.center - Point.at(0,150))
  # draw :person4, model: "Person", position: (Game.center - Point.at(-100,200))

  draw :map, model: "metro::ui::tile_map", file: "first.json", position: "0,0,-1"

  draw :hero

  draw :energy_loss

  def show
    hero.position = map.map.properties['hero.position']
  end

  def viewport
    @viewport ||= Bounds.new left: 0, top: 0, right: 836, bottom: 608
  end

  def after_initialize
    map.viewport = viewport
  end

  draws :cough_virus, :reached_goal
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
    body_collision.move_sprite_by(body,point)
  end

  event :on_up, KbSpace do
    hero.angle += hero.turn_amount
  end


  def update
    self.energy.current = hero.energy
  end

end
