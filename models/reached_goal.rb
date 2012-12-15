class ReachedGoal < Metro::Model

  def map
    scene.drawers.find { |drawer| drawer.model == "metro::ui::tile_map" }
  end

  def layer
    @layer ||= map.layers.first
  end

  def goal_image_index
    5
  end

  def goal_tile_bounds
    @goal_tiles ||= begin
      layer.data.each_with_index.map do |image_index,position|
        next unless image_index == goal_image_index
        image = layer.tileset_image(image_index)
        layer.position_of_image(image,layer.row(position),layer.column(position))
      end.compact
    end
  end

  def hero_reached_goal?
    goal_tile_bounds.find do |b| 
      b.contains?(scene.hero.center)
    end
  end

  def update
    puts "You Win" if hero_reached_goal?
  end

end