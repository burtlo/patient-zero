class Person < Metro::UI::Sprite

  class Healthy < Metro::Model
    property :image, path: "healthy.png"
    property :infectable, type: :boolean, default: true
  end

  class Infected < Metro::Model
    property :image, path: "infected.png"
    property :infectable, type: :boolean, default: false
  end

  def show
    @state = create "Person::Healthy"
  end

  attr_reader :state

  def infectable?
    state.infectable
  end
  
  def infect!
    @state = create "Person::Infected"
  end

  def image
    state.image
  end

end
