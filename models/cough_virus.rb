class CoughVirus < Metro::Model

  def people
    scene.updaters.find_all { |actor| actor.is_a? Person }
  end

  def infected
    scene.updaters.find_all { |actor| actor.respond_to?(:infected?) and actor.infected? }
  end

  def other_people(target)
    people - [ target ]
  end

  def update
    infected.each do |sick|
      generate_cough(sick)
      get_away_from_other_sick_people(sick)
    end
  end

  def get_away_from_other_sick_people(sick)
    other_people(sick).each do |other|
      slope = Line.slope(sick.center,other.center)
      angle = Math.cos(slope)

      puts "Slope: #{slope}"

      offset_x = Math.cos(slope) * sick.move_amount
      offset_y = Math.sin(slope) * sick.move_amount

      offset_x = offset_x * -1 if slope == 0.0 and sick.center.x < other.center.x

      sick.position = sick.position + Point.at(offset_x,offset_y)
    end
  end

  def generate_cough(sick)
    # sickness_index = rand(sick.state.sickness_level)
    sickness_index = sick.state.sickness_level
    # puts "Sickie #{sick.state.sickness_level} #{sickness_index}"
    return unless sickness_index == 98
    cough = create "cough", position: sick.position, color: "rgba(255,255,255,0.3)",
      max_power: 20
    scene.add(cough)
  end


end