class DeathScene < GameScene

  draw :title

  draw :menu, options: [ 'Try Again', 'Exit' ]

  event :on_up, KbEscape do
    exit
  end

  def try_again
    transition_to :title
  end

end