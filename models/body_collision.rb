class BodyCollision < Metro::Model

  def update
    all_people_in_contact_with_hero.each {|person| person.infect! }
  end

  private

  def hero
    scene.hero
  end

  def people
    scene.updaters.find_all { |person| person.is_a? Person }
  end

  def all_people_in_contact_with_hero
    people.find_all { |p| p.bounds.intersect?(hero.bounds) }
  end

end