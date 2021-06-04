class ShipNavigator

  def initialize
    @data = [0,0,"east"]
  end

  def take_action(action)
    if action[0] == "E"
      @data[0] += action[1].to_i
    elsif action[0] == "N"
      @data[1] += action[1].to_i
    elsif action[0] == "S"
      @data[1] -= action[1].to_i
    elsif action[0] == "W"
      @data[0] -= action[1].to_i
    end
    cardinal_directions = ["north","east","south","west"]
    if action[0] == "L"
      rotation = action[1..-1].to_i/90
      new_direction = (cardinal_directions.index(@data[2]) - rotation) % 4
      @data[2] = cardinal_directions[new_direction]
    end

    if action[0] == "R"
      rotation = action[1..-1].to_i/90
      new_direction = (cardinal_directions.index(@data[2]) + rotation) % 4
      @data[2] = cardinal_directions[new_direction]
    end

    if action[0] == "F"
      direction_hash = {"east" => [action[1..-1].to_i,0], "north" => [0,action[1..-1].to_i],
        "west" => [-action[1..-1].to_i,0], "south" => [0,-action[1..-1].to_i]}
      @data[0] += direction_hash[@data[2]][0]
      @data[1] += direction_hash[@data[2]][1]

    end
  end

end
