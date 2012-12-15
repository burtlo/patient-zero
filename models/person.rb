class Person < Metro::UI::Sprite

  property :move_amount, default: 1.5

  class Healthy < Metro::Model
    property :image, path: "healthy.png"
    property :infectable, type: :boolean, default: true
    property :concern_distance, default: 200
  end

  class Infected < Metro::Model
    property :image, path: "infected.png"
    property :infectable, type: :boolean, default: false
    property :concern_distance, default: 0

    property :sickness_level, default: 100
    property :recover_rate, default: 2

    def update
      self.sickness_level = sickness_level - recover_rate
    end

    def completed?
      self.sickness_level <= 0
    end

    def next
      "Person::Healthy"
    end
  end

  def show
    @state = create "Person::Healthy"
  end

  attr_reader :state

  def infected?
    @state.class == Infected
  end

  def infectable?
    state.infectable
  end

  def infect!
    @state = create "Person::Infected"
  end

  def concern_distance
    state.concern_distance
  end

  def image
    state.image
  end

  def update
    super
    state.update
    @state = create state.next if state.completed?
  end

end
