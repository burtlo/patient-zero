class Person < Metro::UI::AnimatedSprite

  property :move_amount, default: 1.5

  class Healthy < Metro::Model
    property :animation, path: "person-animated.png",
      dimensions: Dimensions.of(32,32), time_per_image: 200

    property :infectable, type: :boolean, default: true
    property :concern_distance, default: 200
  end

  class Infected < Metro::Model
    property :animation, path: "infected-animated.png",
      dimensions: Dimensions.of(32,32), time_per_image: 200

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

  class Dying < Metro::Model

    property :animation, path: "infected-animated.png",
      dimensions: Dimensions.of(32,32), time_per_image: 200

    property :infectable, type: :boolean, default: false
    property :concern_distance, default: 0

    def next
      "Person::Death"
    end
  end

  def current_image
    state.animation.image
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

  def kill!
    @state = create "Person::Dying" unless @state.class == Dying
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
