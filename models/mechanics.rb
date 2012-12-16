class Mechanics < Metro::Model

  property :cough_virus, type: :model do
    create "cough_virus"
  end

  property :energy_loss, type: :model do
    create "energy_loss"
  end

  property :panic, type: :model do
    create "panic"
  end
  
  property :death_check, type: :model do
    create "death_check"
  end

  def update
    death_check.update
    panic.update
    cough_virus.update
    energy_loss.update
  end

end