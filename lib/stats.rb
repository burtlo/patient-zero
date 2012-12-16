module Stats
  extend self

  def current_energy
    @current_energy ||= starting_energy
  end

  def current_energy=(value)
    @current_energy = value
  end

  def starting_energy
    100
  end

  def reset!
    self.current_energy = starting_energy
  end

  def healthy_people
    @healthy_people ||= 0
  end

  def healthy_people=(value)
    @healthy_people = value
  end

  def bump_infected
    @infected_people += 1
  end

  def infected_people
    @infected_people ||= 0
  end

  def infected_people=(value)
    @infected_people = value
  end

end