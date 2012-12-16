class BrandToTitleScene < GameScene

  play :theme, song: 'patient-zero-theme.ogg'

  draws :title, :menu

  after 2.second do
    animate :title, to: { alpha: 255 }, interval: 4.seconds
  end

  after 5.seconds do
    animate :menu, to: { alpha: 255 }, interval: 4.seconds
  end

  after 10.seconds do
    transition_to :title
  end

  event :cancel do
    transition_to :title
  end

end