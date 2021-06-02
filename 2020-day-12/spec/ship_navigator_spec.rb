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
  end

end
