require_relative "../seating_system"

describe SeatingSystem do

  context "#identify_adjacents" do

    it "returns [] for 0,0 and #" do
      expect(SeatingSystem.new([["#"]]).identify_adjacents([0,0])).to eq([])
    end

    it "returns [#] for 0,0 and ##" do
      expect(SeatingSystem.new([["#","#"]]).identify_adjacents([0,0])).to eq(["#"])
    end

    it "returns [L] for 0,0 and LL" do
      expect(SeatingSystem.new([["L","L"]]).identify_adjacents([0,0])).to eq(["L"])
    end

  end

end
