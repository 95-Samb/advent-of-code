require_relative "../ship_waypoint_navigator"

describe ShipWaypointNavigator do

  context "#take_action" do

    it "returns 0,0,E and 11,1 for E1" do

      start = ShipWaypointNavigator.new
      start.take_action("E1")

      expect(start.instance_variable_get(:@position)).to eq([0,0,"E"])
      expect(start.instance_variable_get(:@waypoint)).to eq([11,1])

    end
  end

end
