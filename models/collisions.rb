class Collisions < Metro::Model

  property :body_collision, type: :model do
    create "body_collision"
  end

  property :wall_collision, type: :model do
    create "wall_collision"
  end

  property :reached_goal, type: :model do
    create "reached_goal"
  end

  def move_sprite_by(body,point)
    wall_collision.move_sprite_by(body,point)
  end

  def update
    body_collision.update
    wall_collision.update
    reached_goal.update
  end

end