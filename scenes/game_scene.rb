class GameScene < Metro::Scene

  #
  # The game scene is a place where you can define actors and
  # events here that will be present within all the subclassed
  # scenes.

  event :on_up, KbR do |event|
    transition_to(scene_name)
  end

  #
  # This animation helper will fade in and fade out information.
  #
  def fade_in_and_out(name)
    animate name, to: { alpha: 255 }, interval: 2.seconds do
      after 1.second do
        animate name, to: { alpha: 0 }, interval: 1.second do
          yield if block_given?
        end
      end
    end
  end

end


class ActionScene < GameScene

  event :on_hold, KbLeft, GpLeft do
    collisions.move_sprite_by(hero,Point.new(-hero.move_amount,0,0))
  end

  event :on_hold, KbRight, GpRight do
    collisions.move_sprite_by(hero,Point.new(hero.move_amount,0,0))
  end

  event :on_hold, KbUp, GpUp do
    collisions.move_sprite_by(hero,Point.new(0,-hero.move_amount,0))
  end

  event :on_hold, KbDown, GpDown do
    collisions.move_sprite_by(hero,Point.new(0,hero.move_amount,0))
  end

  event :notification, :reached_goal do
    transition_to next_scene
  end

  def next_scene
    scene_name
  end

  def viewport
    @viewport ||= Bounds.new left: 0, top: 0, right: 800, bottom: 600
  end

  def show
    hero.energy = Stats.current_energy
    hero.position = map.map.properties['hero.position']
    place_people
  end
  
  def place_people
    pp = PlacePeople.new
    pp.scene = self
    pp.window = window
    pp.show
  end

  def prepare_transition_to(new_scene)
    Stats.current_energy = hero.energy
    Stats.healthy_people += people.find_all {|p| p.healthy? }.count
    Stats.bump_screens
  end

  def people
    updaters.find_all {|updater| updater.is_a? Person }
  end

  def after_initialize
    map.viewport = viewport
  end

  def update
    self.energy.current = hero.energy
    self.score.text = "Infected: #{Stats.infected_people}"
  end

end