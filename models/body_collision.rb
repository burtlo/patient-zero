class BodyCollision < Metro::Model

  def people
    scene.updaters.find_all { |person| person.is_a? Person }.map {|p| p.bounds }
  end

  def bodies
    people + [scene.hero.bounds ] + blocking_tiles
  end

  def other_bodies(body)
    bodies.reject {|b| b == body }
  end

  def map
    scene.drawers.find { |drawer| drawer.model == "metro::ui::tile_map" }
  end

  def layer
    @layer ||= map.layers.first
  end

  def blocking_image_indexes
    [ 2 ]
  end

  def blocking_tiles
    @goal_tiles ||= begin
      layer.data.each_with_index.map do |image_index,position|
        next unless blocking_image_indexes.include?(image_index)
        image = layer.tileset_image(image_index)
        b = layer.position_of_image(image,layer.row(position),layer.column(position))
        duplicate_and_fix_bounds(b)
      end.compact
    end
  end

  def duplicate_and_fix_bounds(b)
    Bounds.new left: b.left - (b.right - b.left), top: b.top - (b.bottom - b.top),
      right: b.right - (b.right - b.left)/2, bottom: b.bottom
  end

  def move_sprite_by(body,point)
    new_bounds = body.bounds.shift(point)
    blocking = other_bodies(body).find {|body| body.intersect?(new_bounds) }
    unless blocking
      body.position = body.position + point
    end
  end

end