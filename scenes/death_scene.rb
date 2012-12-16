class DeathScene < GameScene

  play :reqium, song: 'patient-zero-requim.ogg'

  draws :title, :infected, :screens

  draw :menu, options: [ 'Try Again', 'Exit' ]

  event :cancel do
    exit
  end

  def try_again
    transition_to :title
  end

end