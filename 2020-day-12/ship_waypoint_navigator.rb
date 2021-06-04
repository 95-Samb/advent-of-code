class ShipWaypointNavigator 

  def initialize
    @position = [0,0,"E"]
    @waypoint = [10,1]
  end

  def take_action(action)

    waypoint_direction_hash = {"N" => [0,action[1..-1].to_i],"E" => [action[1..-1].to_i,0] ,
      "S" => [0,-(action[1..-1].to_i)],"W" => [-(action[1..-1].to_i),0]}

    if waypoint_direction_hash[action[0]]
      @waypoint[0] += waypoint_direction_hash[action[0]][0]
      @waypoint[1] += waypoint_direction_hash[action[0]][1]
    end
  end

end
