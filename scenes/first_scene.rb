class FirstScene < ActionScene
  draw :fps, model: "metro::ui::fps", placement: 'bottom_right'

  draw :energy, position: Point.at(20,20,15), dimensions: Dimensions.of(100,20)

  draw :map, model: "metro::ui::tile_map", file: "first.json", position: "0,0,-1"

  draw :hero

  draw :energy_loss

  def show
    hero.position = map.map.properties['hero.position']
  end

  event :notification, :reached_goal do
    transition_to :second
  end

  def viewport
    @viewport ||= Bounds.new left: 0, top: 0, right: 800, bottom: 600
  end

  def after_initialize
    map.viewport = viewport
  end

  draws :cough_virus, :reached_goal
  draws :disease_control, :body_collision

  def move_sprite_by(body,point)
    body_collision.move_sprite_by(body,point)
  end

  def update
    self.energy.current = hero.energy
  end

end
