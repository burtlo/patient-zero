class Person < Metro::UI::AnimatedSprite

  property :move_amount, default: 1.5

  class Healthy < Metro::Model
    property :animation, path: "person-animated.png",
      dimensions: Dimensions.of(32,32), time_per_image: 200

    property :panickable, type: :boolean, default: true
    property :infectable, type: :boolean, default: true
    property :concern_distance, default: 200
  end

  class Panicked < Metro::Model
    property :animation, path: "panicked-animated.png",
      dimensions: Dimensions.of(32,32), time_per_image: 200

    property :infectable, type: :boolean, default: true
    property :panickable, type: :boolean, default: false
    property :concern_distance, default: 300
    
    property :panic_level, default: 100
    property :recover_rate, default: 2

    def update
      self.panic_level = panic_level - recover_rate
    end

    def completed?
      self.panic_level <= 0
    end

    def next
      "Person::Healthy"
    end
    
  end

  class Infected < Metro::Model
    property :animation, path: "infected-animated.png",
      dimensions: Dimensions.of(32,32), time_per_image: 200

    property :infectable, type: :boolean, default: false
    property :panickable, type: :boolean, default: false
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
    property :panickable, type: :boolean, default: false
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

  def panicked?
    @state.class == Panicked
  end

  def panickable?
    state.panickable
  end

  def infected?
    @state.class == Infected
  end

  def infectable?
    state.infectable
  end

  def panic!
    @state = create "Person::Panicked" if panickable?
  end

  def infect!
    @state = create "Person::Infected"
  end

  def dying?
    @state.class == Dying
  end

  def kill!
    @state = create "Person::Dying" unless dying?
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
