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

    it "changes data to 0,3,east for N3" do

      position = ShipNavigator.new
      position.instance_variable_set(:@data, [0,2,"east"])
      position.take_action("N3")

      expect(position.instance_variable_get(:@data)).to eq([0,5,"east"])

    end

    it "changes data to 0,0,north for L90" do

      position = ShipNavigator.new
      position.take_action("L90")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"north"])

    end

    it "changes data to 0,0,south for L270" do

      position = ShipNavigator.new
      position.take_action("L270")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"south"])

    end

    it "changes data to 0,0,west for L180" do

      position = ShipNavigator.new
      position.take_action("L180")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"west"])

    end

    it "changes data to 0,0,east for L360" do

      position = ShipNavigator.new
      position.take_action("L360")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"east"])

    end

    it "changes data to 0,0,south for R90" do

      position = ShipNavigator.new
      position.take_action("R90")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"south"])

    end


  end

end
