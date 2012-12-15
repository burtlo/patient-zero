class DiseaseControl < Metro::Model

  def coughs
    scene.updaters.find_all {|updater| updater.is_a? Cough }
  end

  def update
    coughs.each do |cough|
      collisions_with?(cough).each {|victim| victim.infect! }
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