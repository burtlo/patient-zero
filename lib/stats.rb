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

end