class ShipWaypointNavigator 

  def initialize
    @position = [0,0,"E"]
    @waypoint = [10,1]
  end

  def take_action(action)

    @waypoint[0] += 1

  end

end
