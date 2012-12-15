class Panic < Metro::Model

  def update
    people_close_to_coughs.each {|victim| victim.panic! }
  end

  private

  def people_close_to_coughs
    coughs.map {|cough| collisions_with?(cough) }.flatten
  end

  def coughs
    scene.updaters.find_all {|updater| updater.is_a? Cough }
  end

  def people
    scene.updaters.find_all {|updater| updater.is_a? Person }
  end

  def collisions_with?(target)
    people.find_all { |person| target.bounds.intersect?(person.bounds) }
  end

end