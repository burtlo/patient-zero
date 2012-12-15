class FirstScene < GameScene

  draw :hero, position: Game.center
  
  draw :person, position: (Game.center - Point.at(128,128))

  def update
  end

end
