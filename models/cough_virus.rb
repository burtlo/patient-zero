class CoughVirus < Metro::Model

  def people
    scene.updaters.find_all { |person| person.is_a? Person }
  end

  def infected
    scene.updaters.find_all { |person| _infected?(person) }
  end

  def other_people(target)
    people - [ target ]
  end

  def update
    people.each do |person|
      if _infected?(person)
        generate_cough(person)
      else
        get_away_from_other_sick_people(person)
      end
    end
  end

  def _infected?(person)
    person.respond_to?(:infected?) and person.infected?
  end

  def get_away_from_other_sick_people(healthy_person)
    point = Point.zero

    infected.each do |other|

      line = Line.new(healthy_person.center,other.center)
      next unless line.distance < healthy_person.concern_distance

      if line.slope.infinite?
        offset_y = healthy_person.move_amount
        offset_x = 0
      else
        offset_y = Math.sin(line.slope) * healthy_person.move_amount
        offset_x = Math.cos(line.slope) * healthy_person.move_amount
      end

      offset_y = offset_y * -1 if healthy_person.center.y < other.center.y
      offset_x = offset_x * -1 if healthy_person.center.x > other.center.x

      point = point + Point.at(offset_x,offset_y)
    end

    scene.move_sprite_by(healthy_person,point)
  end

  def coughing_point
    64
  end

  def generate_cough(sick)
    # sickness_index = rand(sick.state.sickness_level)
    sickness_index = sick.state.sickness_level
    # puts "Sickie #{sick.state.sickness_level} #{sickness_index}"
    return unless sickness_index == coughing_point
    cough = create "cough", position: sick.position, color: "rgba(255,255,255,0.3)",
      max_power: 20
    scene.add(cough)
  end


end