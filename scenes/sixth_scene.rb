class SixthScene < ActionScene

  draw :score, model: "metro::ui::label", position: "20,570,10", text: ""

  draw :energy, position: Point.at(20,20,15), dimensions: Dimensions.of(100,20),
    color: "rgba(97,186,52,1.0)", fill_color: "rgba(97,186,52,0.6)"

  draws :hero, :collisions, :mechanics

  draw :map, model: "metro::ui::tile_map", file: "sixth.json", position: "0,0,-1"

  draw :person, model: "Person", position: "420,250,1"
  draw :person2, model: "Person", position: "380,150,1"
  draw :person3, model: "Person", position: "500,300,1"
  draw :person4, model: "Person", position: "420,380,1"
  draw :person5, model: "Person", position: "270,225,1"
  draw :person6, model: "Person", position: "280,355,1"
  draw :person7, model: "Person", position: "310,365,1"
  draw :person8, model: "Person", position: "340,395,1"

  def next_scene
    :first
  end

end
