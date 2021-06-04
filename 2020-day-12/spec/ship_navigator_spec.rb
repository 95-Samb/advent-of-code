require_relative "../ship_navigator"

describe ShipNavigator do

  context "#take_action" do

    it "changes data to 1,0,E for E1" do

      position = ShipNavigator.new
      position.take_action("E1")

      expect(position.instance_variable_get(:@data)).to eq([1,0,"E"])

    end

    it "changes data to -1,0,E for W1" do

      position = ShipNavigator.new
      position.take_action("W1")

      expect(position.instance_variable_get(:@data)).to eq([-1,0,"E"])

    end

    it "changes data to 0,1,E for N1" do

      position = ShipNavigator.new
      position.take_action("N1")

      expect(position.instance_variable_get(:@data)).to eq([0,1,"E"])

    end

    it "changes data to 0,-1,E for S1" do

      position = ShipNavigator.new
      position.take_action("S1")

      expect(position.instance_variable_get(:@data)).to eq([0,-1,"E"])

    end

    it "changes data to 2,0,E for E2" do

      position = ShipNavigator.new
      position.take_action("E2")

      expect(position.instance_variable_get(:@data)).to eq([2,0,"E"])

    end

    it "changes data to 0,3,E for N3" do

      position = ShipNavigator.new
      position.take_action("N3")

      expect(position.instance_variable_get(:@data)).to eq([0,3,"E"])

    end

    it "changes data to 0,0,N for L90" do

      position = ShipNavigator.new
      position.take_action("L90")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"N"])

    end

    it "changes data to 0,0,S for L270" do

      position = ShipNavigator.new
      position.take_action("L270")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"S"])

    end

    it "changes data to 0,0,W for L180" do

      position = ShipNavigator.new
      position.take_action("L180")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"W"])

    end

    it "changes data to 0,0,E for L360" do

      position = ShipNavigator.new
      position.take_action("L360")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"E"])

    end

    it "changes data to 0,0,S for R90" do

      position = ShipNavigator.new
      position.take_action("R90")

      expect(position.instance_variable_get(:@data)).to eq([0,0,"S"])

    end

    it "changes data to 1,0,E for F1" do

      position = ShipNavigator.new
      position.take_action("F1")

      expect(position.instance_variable_get(:@data)).to eq([1,0,"E"])

    end

    it "changes data to 11,0,E for F11" do

      position = ShipNavigator.new
      position.take_action("F11")

      expect(position.instance_variable_get(:@data)).to eq([11,0,"E"])

    end

    context "for non 0,0,E starting point" do

      it "changes data to 0,5,E for N3 and 0,2,E starting point" do

        position = ShipNavigator.new
        position.instance_variable_set(:@data, [0,2,"E"])
        position.take_action("N3")

        expect(position.instance_variable_get(:@data)).to eq([0,5,"E"])

      end

      it "changes data to 1,0,W for F1 and 0,0,W starting point" do

        position = ShipNavigator.new
        position.instance_variable_set(:@data,[0,0,"W"])
        position.take_action("F1")

        expect(position.instance_variable_get(:@data)).to eq([-1,0,"W"])

      end

    end


  end

end
