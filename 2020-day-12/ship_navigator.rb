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
  end

end
