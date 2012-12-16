class DeathCheck < Metro::Model

  def update
    scene.transition_to :death unless hero_has_enough_energy_to_continue?
  end

  private

  def hero
    scene.hero
  end

  def hero_has_enough_energy_to_continue?
    hero.energy > dead_at_energy_level
  end

  def dead_at_energy_level
    0
  end

end