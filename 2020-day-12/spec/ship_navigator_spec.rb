require_relative "../ship_navigator"

describe ShipNavigator do

  context "#take_action" do

    it "changes data to 1,0,east for E1" do

      position = ShipNavigator.new
      position.take_action("E1")

      expect(position.instance_variable_get(:@data)).to eq([1,0,"east"])

    end

    it "changes data to -1,0,east for W1" do

      position = ShipNavigator.new
      position.take_action("W1")

      expect(position.instance_variable_get(:@data)).to eq([-1,0,"east"])

    end

    it "changes data to 0,1,east for N1" do

      position = ShipNavigator.new
      position.take_action("N1")

      expect(position.instance_variable_get(:@data)).to eq([0,1,"east"])

    end

    it "changes data to 0,-1,east for S1" do

      position = ShipNavigator.new
      position.take_action("S1")

      expect(position.instance_variable_get(:@data)).to eq([0,-1,"east"])

    end

    it "changes data to 2,0,east for E2" do

      position = ShipNavigator.new
      position.take_action("E2")

      expect(position.instance_variable_get(:@data)).to eq([2,0,"east"])

    end

    it "changes data to 0,3,east for N3" do

      position = ShipNavigator.new
      position.take_action("N3")

      expect(position.instance_variable_get(:@data)).to eq([0,3,"east"])

    end
  end

end
