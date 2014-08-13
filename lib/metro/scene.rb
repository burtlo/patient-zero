class Metro::Scene

  def add(model)
    drawers.push model
    updaters.push model
  end

  # def base_draw
  #   drawers.each { |drawer| drawer.draw }
  #   draw
  #   drawers.reject! { |drawer| drawer.completed? }
  # end

end