class PlacePeople < Metro::Model

  def additional_people
    5
  end

  def show
    additional_people.times do
      bounds = placment_tiles.sample
      point = Point.at(bounds.left + (bounds.right - bounds.left)/2,bounds.top + (bounds.bottom - bounds.top)/2)
      person = create "Person", model: "Person", position: point
      scene.updaters.push person
      scene.drawers.push person
    end
  end

  private

  def layer
    scene.map.send(:layers).first
  end

  def placement_tile_indexes
    @placement_tile_indexes ||= [ 4 ]
  end

  def placment_tiles
    @placment_tiles ||= begin
      layer.data.each_with_index.map do |image_index,position|
        next unless placement_tile_indexes.include?(image_index)
        image = layer.send(:tileset_image,image_index)
        b = layer.position_of_image(image,layer.send(:row,position),layer.send(:column,position))
        duplicate_and_fix_bounds(b)
      end.compact
    end
  end

  def duplicate_and_fix_bounds(b)
    Bounds.new left: b.left - (b.right - b.left)/2, top: b.top - (b.bottom - b.top),
      right: b.right - (b.right - b.left)/2, bottom: b.bottom
  end

end