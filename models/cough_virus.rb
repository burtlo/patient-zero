class CoughVirus < Metro::Model

  def infected
    scene.updaters.find_all { |actor| actor.respond_to?(:infected?) and actor.infected? }
  end

  def update
    infected.each do |sick|
      # puts "#{sick.name} might cough"
    end
  end

end