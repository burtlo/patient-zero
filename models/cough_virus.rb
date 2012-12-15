class CoughVirus < Metro::Model

  def infected
    scene.updaters.find_all { |actor| actor.respond_to?(:infected?) and actor.infected? }
  end

  def update
    infected.each do |sick|
      generate_cough(sick)
    end
  end
  
  def generate_cough(sick)
    sickness_index = rand(sick.state.sickness_level)
    puts "Sickie #{sick.state.sickness_level} #{sickness_index}"
    return unless sickness_index > 80
    cough = create "cough", position: sick.position, color: "rgba(255,255,255,0.3)", 
      max_power: 30
    scene.add(cough)
  end
  

end