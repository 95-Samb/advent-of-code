require_relative "../ship_waypoint_navigator"

describe ShipWaypointNavigator do

  context "#take_action" do

    it "returns 0,0,E and 11,1 for E1" do

      start = ShipWaypointNavigator.new
      start.take_action("E1")

      expect(start.instance_variable_get(:@position)).to eq([0,0])
      expect(start.instance_variable_get(:@waypoint)).to eq([11,1])

    end

    it "returns 0,0,E and 10,2 for N1" do

      start = ShipWaypointNavigator.new
      start.take_action("N1")

      expect(start.instance_variable_get(:@position)).to eq([0,0])
      expect(start.instance_variable_get(:@waypoint)).to eq([10,2])

    end

    it "returns 0,0,E and -1,1 for W11" do

      start = ShipWaypointNavigator.new
      start.take_action("W11")

      expect(start.instance_variable_get(:@position)).to eq([0,0])
      expect(start.instance_variable_get(:@waypoint)).to eq([-1,1])

    end

    it "returns 0,0,E and -1,10 for L90" do

      start = ShipWaypointNavigator.new
      start.take_action("L90")

      expect(start.instance_variable_get(:@position)).to eq([0,0])
      expect(start.instance_variable_get(:@waypoint)).to eq([-1,10])

    end

    it "returns 0,0,E and 1,-10 for R90" do

      start = ShipWaypointNavigator.new
      start.take_action("R90")

      expect(start.instance_variable_get(:@position)).to eq([0,0])
      expect(start.instance_variable_get(:@waypoint)).to eq([1,-10])

    end

    it "returns 10,1,E and 10,1 for F1" do

      start = ShipWaypointNavigator.new
      start.take_action("F1")

      expect(start.instance_variable_get(:@position)).to eq([10,1])
      expect(start.instance_variable_get(:@waypoint)).to eq([10,1])

    end

    it "returns 15,15,E and 5,5 for F3" do

      start = ShipWaypointNavigator.new
      start.instance_variable_set(:@waypoint,[5,5])
      start.take_action("F3")

      expect(start.instance_variable_get(:@position)).to eq([15,15])
      expect(start.instance_variable_get(:@waypoint)).to eq([5,5])

    end

    it "returns 0,0,E and 1,-10 for L270" do

      start = ShipWaypointNavigator.new
      start.take_action("L270")

      expect(start.instance_variable_get(:@position)).to eq([0,0])
      expect(start.instance_variable_get(:@waypoint)).to eq([1,-10])

    end

    it "returns 0,0,E and -1,10 for R270" do

      start = ShipWaypointNavigator.new
      start.take_action("R270")

      expect(start.instance_variable_get(:@position)).to eq([0,0])
      expect(start.instance_variable_get(:@waypoint)).to eq([-1,10])

    end
  end

end
