class ShipWaypointNavigator 

  def initialize
    @position = [0,0]
    @waypoint = [10,1]
  end

  def take_action(action)

    waypoint_direction_hash = {"N" => [0,action[1..-1].to_i],"E" => [action[1..-1].to_i,0] ,
      "S" => [0,-(action[1..-1].to_i)],"W" => [-(action[1..-1].to_i),0]}

    if waypoint_direction_hash[action[0]]

      @waypoint[0] += waypoint_direction_hash[action[0]][0]
      @waypoint[1] += waypoint_direction_hash[action[0]][1]

    end

    cardinal_directions = waypoint_direction_hash.keys

    if action[0] == "L"

      (action[1..-1].to_i/90).times do
        horizontal = -@waypoint[1]
        vertical = @waypoint[0]
        @waypoint = [horizontal,vertical]
      end

    end

    if action[0] == "R"

      (action[1..-1].to_i/90).times do
        horizontal = @waypoint[1]
        vertical = -@waypoint[0]
        @waypoint = [horizontal,vertical]
      end

    end

    if action[0] == "F"

      @position[0] += @waypoint[0] * action[1..-1].to_i
      @position[1] += @waypoint[1] * action[1..-1].to_i

    end
  end

end
