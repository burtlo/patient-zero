class TitleScene < GameScene

  draw :title

  draw :menu, options: [ 'Start Game', 'Exit' ]

  def start_game
    Stats.reset!
    transition_to :first
  end

end