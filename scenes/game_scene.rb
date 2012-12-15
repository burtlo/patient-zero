

class GameScene < Metro::Scene

  #
  # The game scene is a place where you can define actors and
  # events here that will be present within all the subclassed
  # scenes.

  event :on_up, KbR do |event|
    transition_to(scene_name)
  end

  #
  # This animation helper will fade in and fade out information.
  #
  def fade_in_and_out(name)
    animate name, to: { alpha: 255 }, interval: 2.seconds do
      after 1.second do
        animate name, to: { alpha: 0 }, interval: 1.second do
          yield if block_given?
        end
      end
    end
  end

end
