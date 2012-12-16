class CoughVirus < Metro::Model

  def update
    people.each do |person|
      if person.infected?
        generate_cough(person)
      elsif person.panicked?
        get_away_from_other_sick_people(person)
      end
    end
  end

  private

  def coughs
    scene.updaters.find_all { |updater| updater.is_a? Cough }
  end

  def people
    scene.updaters.find_all { |updater| updater.is_a? Person }
  end

  def infections
    people.find_all { |person| person.infected? } + coughs
  end

  def other_people(target)
    people + coughs - [ target ]
  end

  def get_away_from_other_sick_people(healthy_person)
    point = Point.zero

    infections.each do |other|

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
      offset_x = offset_x * -1  if healthy_person.center.x < other.center.x

      point = point + Point.at(offset_x,offset_y)
    end

    move_sprite_by(healthy_person,point)
  end

  def move_sprite_by(target,point)
    scene.collisions.move_sprite_by(target,point)
  end

  def coughing_point
    90
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