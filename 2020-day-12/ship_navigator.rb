class ShipNavigator

  def initialize
    @data = [0,0,"E"]
  end

  def take_action(action)

    direction_hash = {"N" => [0,action[1..-1].to_i],"E" => [action[1..-1].to_i,0] ,
      "S" => [0,-(action[1..-1].to_i)],"W" => [-(action[1..-1].to_i),0]}

    if direction_hash[action[0]]
      @data[0] += direction_hash[action[0]][0]
      @data[1] += direction_hash[action[0]][1]
    end

    cardinal_directions = direction_hash.keys
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

      @data[0] += direction_hash[@data[2]][0]
      @data[1] += direction_hash[@data[2]][1]

    end
  end

end
