class EnergyLoss < Metro::Model

  property :energy_loss_per_tick, default: 0.1

  def hero
    scene.hero
  end

  def update
    hero.energy -= energy_loss_per_tick
  end
end