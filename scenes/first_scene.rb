class FirstScene < ActionScene

  draw :score, model: "metro::ui::label", position: "20,570,10", text: ""

  draw :energy, position: Point.at(20,20,15), dimensions: Dimensions.of(100,20),
    color: "rgba(97,186,52,0.6)", fill_color: "rgba(97,186,52,0.6)"

  draws :hero, :collisions, :mechanics

  draw :map, model: "metro::ui::tile_map", file: "first.json", position: "0,0,-1"

  draw :person, model: "Person", position: "420,250,1"
  draw :person2, model: "Person", position: "380,150,1"
  draw :person3, model: "Person", position: "200,450,1"
  draw :person4, model: "Person", position: "625,250,1"

  def next_scene
    :second
  end

end
