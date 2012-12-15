class SecondScene < GameScene
  # By default the Scene Name is based on the class name
  # but that can be overridden with the scene_name class method
  # scene_name "credits"

  draw :title

  #
  # DRAWING and ACTORS
  #
  # @example Explicitly drawing a text label in the scene
  #
  # draw :title, model: 'metro::ui::label',
  #   text: 'Title Screen',
  #   position: '20,20,0',
  #   font: { size: 60 },
  #   color: 'rgba(255,255,255,1.0)',
  #   align: 'center',
  #   vertical_align: 'center'
  #
  #
  # The draw method can be simpler for models that have content defined
  # for them in the view or the models themselves define the appropriate
  # fields.
  #
  # @example defining multiple things to draw; their visual data would be
  #   stored within the respective view file
  #
  # draws :title, :hero, :enemy
  #

  #
  # ANIMATIONS
  #
  # @example of the title being moved to a new y position and the alpha level
  #
  # animate :title, to: { y: 80, alpha: 50 }, interval: 120.ticks do
  #   puts "Done Animating!"
  # end
  #
  # @example of using nested animations and after blocks to generate a fade in
  #   and fade out effect.
  #
  # after 2.seconds do
  #   animate :title, to: { alpha: 255 }, interval: 1.second do
  #     after 1.second do
  #       animate :title, to: { alpha: 0 }, interval: 1.second
  #     end
  #   end
  # end
  #
  # @note the interval can be specified in game ticks ( 1.tick, 23.ticks ) or
  #   in seconds ( 1.second, 23.seconds ). 60 game times are roughly equivalent
  #   to 1 second, however you should not use Metro for monitoring a nuclear
  #   reactor.
  #

  #
  # Example Event Handling Definitions
  #
  # @example Registering the keyboard down event to execute a block of code
  #
  # event :on_down, GpLeft, GpUp, do
  #   transition_to :next_scene
  # end
  #
  # @example Registering the keyboard up key to execute the method `leave_scene`
  #
  # event :on_up, KbEscape, do: :leave_scene
  #
  # @example Registering for button held events that would move an actor named `player`
  #
  # event :on_hold, KbRight, GpRight do
  #   title.alpha = title.alpha - 1
  # end
  # Keystroke and Game Event Reference
  #
  # @see https://github.com/jlnr/gosu/blob/master/Gosu/ButtonsMac.hpp
  # @see https://github.com/jlnr/gosu/blob/master/Gosu/ButtonsX.hpp
  # @see https://github.com/jlnr/gosu/blob/master/Gosu/ButtonsWin.hpp
  #
  #
  # @example Registering for an event called 'save_complete' event that anyone
  #   can generate and this scene block will execute this code.
  #
  # event :notification, :save_complete do
  #   puts "Save Complete!"
  # end
  #
  # Within the scene or in the models you could use the method `notification`
  # to generate the notification
  #
  # def update
  #   if player.x > 600 and player.y > 440
  #     notification :player_wins
  #   end
  # end
  #

  #
  # As Scene does a lot of work for you with regarding to setting up content, it is
  # best not to override #initialize and instead define an #after_initialize method
  # within the subclasses of Scene.
  #
  def after_initialize ; end

  #
  # This method is called right after the scene has been adopted by the window.
  # This is a great place to make changes to the scene before the update methods
  # or draw methods have ever been called.
  #
  def show ; end

  #
  # This is called every update interval while the scene is being shown in the
  # window.
  #
  def update ; end

  #
  # This is called after every #update and when the OS wants the window to
  # repaint itself.
  #
  def draw ; end

  #
  # Before a scene is transitioned away from to a new scene, this method is called
  # to allow for the scene to complete any tasks, stop any actions, or pass any
  # information from the existing scene to the scene that is about to replace it.
  #
  def prepare_transition_to(new_scene) ; end

  #
  # Before a scene is transitioned to it is called with the previous scene. This
  # allows for the new scene to retrieve any data from the previous scene to assist
  # with the layout of the current scene.
  #
  def prepare_transition_from(old_scene) ; end

end
