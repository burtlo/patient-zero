class ReachedGoal < Metro::Model

  def map
    scene.drawers.find { |drawer| drawer.model == "metro::ui::tile_map" }
  end

  def layer
    @layer ||= map.send(:layers).first
  end

  def goal_image_index
    5
  end

  def goal_tile_bounds
    @goal_tiles ||= begin
      layer.data.each_with_index.map do |image_index,position|
        next unless image_index == goal_image_index
        image = layer.send(:tileset_image,image_index)
        layer.position_of_image(image,layer.send(:row,position),layer.send(:column,position))
      end.compact
    end
  end

  def hero_reached_goal?
    goal_tile_bounds.find do |b|
      b.intersect?(scene.hero.bounds)
    end
  end

  def update
    notification :reached_goal if hero_reached_goal?
  end

end