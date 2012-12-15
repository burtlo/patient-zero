class DiseaseControl < Metro::Model

  def update
    scene.updaters.each do |updater|
      next unless updater.is_a? Cough
      victims = collisions_with?(updater)
      victims.each {|victim| victim.infect! }
    end
  end

  def collisions_with?(target)
    scene.updaters.find_all do |updater|
      target.bounds.intersect?(updater.bounds) if _infectable?(updater)
    end
  end

  def _infectable?(target)
    target.respond_to?(:infectable?) and target.infectable?
  end

end