class SecondScene < ActionScene

  draw :fps, model: "metro::ui::fps", placement: 'bottom_right'

  draw :energy, position: Point.at(20,20,15), dimensions: Dimensions.of(100,20),
    color: "rgba(97,186,52,1.0)", fill_color: "rgba(97,186,52,0.6)"

  draws :hero, :collisions, :mechanics

  draw :map, model: "metro::ui::tile_map", file: "second.json", position: "0,0,-1"

  draw :person, model: "Person", position: "420,250,1"
  draw :person2, model: "Person", position: "380,150,1"
  draw :person3, model: "Person", position: "380,250,1"
  draw :person4, model: "Person", position: "520,150,1"
  draw :person5, model: "Person", position: "500,190,1"

  def next_scene
    :third
  end

end
