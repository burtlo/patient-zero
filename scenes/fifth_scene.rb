class FifthScene < ActionScene

  draw :score, model: "metro::ui::label", position: "20,570,10", text: ""

  draw :energy, position: Point.at(20,20,15), dimensions: Dimensions.of(100,20),
    color: "rgba(97,186,52,1.0)", fill_color: "rgba(97,186,52,0.6)"

  draws :hero, :collisions, :mechanics

  draw :map, model: "metro::ui::tile_map", file: "fifth.json", position: "0,0,-1"

  draw :person, model: "Person", position: "420,250,1"
  draw :person2, model: "Person", position: "380,175,1"
  draw :person3, model: "Person", position: "580,300,1"
  draw :person4, model: "Person", position: "620,270,1"
  draw :person5, model: "Person", position: "180,175,1"
  draw :person6, model: "Person", position: "220,385,1"

  def next_scene
    :sixth
  end

end
