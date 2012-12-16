class FifthScene < ActionScene

  draw :fps, model: "metro::ui::fps", placement: 'bottom_right'

  draw :energy, position: Point.at(20,20,15), dimensions: Dimensions.of(100,20),
    color: "rgba(97,186,52,1.0)", fill_color: "rgba(97,186,52,0.6)"

  draws :hero, :energy_loss, :cough_virus, :reached_goal, :panic, :body_collision, :wall_collision

  draw :map, model: "metro::ui::tile_map", file: "fifth.json", position: "0,0,-1"

  draw :person, model: "Person", position: "420,250,1"
  draw :person2, model: "Person", position: "380,150,1"

  def next_scene
    :sixth
  end

end
