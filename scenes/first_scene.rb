class FirstScene < ActionScene

  draw :fps, model: "metro::ui::fps", placement: 'bottom_right'

  draw :energy, position: Point.at(20,20,15), dimensions: Dimensions.of(100,20),
    color: "rgba(97,186,52,0.6)", fill_color: "rgba(97,186,52,0.6)"

  draws :hero, :energy_loss, :cough_virus, :reached_goal, :panic, :body_collision, :wall_collision

  draw :map, model: "metro::ui::tile_map", file: "first.json", position: "0,0,-1"

  def next_scene
    :second
  end

end
