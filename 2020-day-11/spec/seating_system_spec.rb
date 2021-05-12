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

    it "returns [L] for 0,1 and L#" do
      expect(SeatingSystem.new([["L","#"]]).identify_adjacents([0,1])).to eq(["L"])
    end

    it "returns [.L] for 0,4 and L#..LL." do
      expect(SeatingSystem.new([["L","#",".",".","L","L","."]]
        ).identify_adjacents([0,4])).to eq([".","L"])
    end

    it "returns [L] for 0,0 and L,L" do
      expect(SeatingSystem.new([["L"],["L"]]
        ).identify_adjacents([0,0])).to eq(["L"])
    end

    it "returns [L] for 1,0 and L,L" do
      expect(SeatingSystem.new([["L"],["L"]]
        ).identify_adjacents([1,0])).to eq(["L"])
    end

    it "returns [L,#] for 1,0 and L,L,#" do
      expect(SeatingSystem.new([["L"],["L"],["#"]]
        ).identify_adjacents([1,0])).to match_array(["L","#"])
    end

    it "returns L..L.#.. for 1,1 and L..,LL.,#.." do
      expect(SeatingSystem.new([["L",".","."],["L","L","."],["#",".","."]]
        ).identify_adjacents([1,1])).
      to match_array(["L",".",".","L",".","#",".","."])
    end

  end

end
