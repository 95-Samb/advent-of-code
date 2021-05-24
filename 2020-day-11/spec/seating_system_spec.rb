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

  context "#apply_rules" do

    it "returns . for ." do
      expect(SeatingSystem.new([["."]]).apply_rules).to eq([["."]])
    end

    it "returns # for L" do
      expect(SeatingSystem.new([["L"]]).apply_rules).to eq([["#"]])
    end

    it "returns ##,## for LL,LL" do
      expect(SeatingSystem.new([["L","L"],["L","L"]]).apply_rules).
      to eq([["#","#"],["#","#"]])
    end

    it "returns ##,## for LL,##" do
      expect(SeatingSystem.new([["L","L"],["#","#"]]).apply_rules).
      to eq([["L","L"],["#","#"]])
    end

    it "returns #L#,#L# for ###,###" do
      expect(SeatingSystem.new([["#","#","#"],["#","#","#"]]).apply_rules).
      to eq([["#","L","#"],["#","L","#"]])
    end

    subject = [["L",".","L","L",".","L","L",".","L","L"],
              ["L","L","L","L","L","L","L",".","L","L"],
              ["L",".","L",".","L",".",".","L",".","."],
              ["L","L","L","L",".","L","L",".","L","L"],
              ["L",".","L","L",".","L","L",".","L","L"],
              ["L",".","L","L","L","L","L",".","L","L"],
              [".",".","L",".","L",".",".",".",".","."],
              ["L","L","L","L","L","L","L","L","L","L"],
              ["L",".","L","L","L","L","L","L",".","L"],
              ["L",".","L","L","L","L","L",".","L","L"]]

    answer =  [["#",".","#","#",".","#","#",".","#","#"],
              ["#","#","#","#","#","#","#",".","#","#"],
              ["#",".","#",".","#",".",".","#",".","."],
              ["#","#","#","#",".","#","#",".","#","#"],
              ["#",".","#","#",".","#","#",".","#","#"],
              ["#",".","#","#","#","#","#",".","#","#"],
              [".",".","#",".","#",".",".",".",".","."],
              ["#","#","#","#","#","#","#","#","#","#"],
              ["#",".","#","#","#","#","#","#",".","#"],
              ["#",".","#","#","#","#","#",".","#","#"]]

    it "returns #{answer} for #{subject}" do
      expect(SeatingSystem.new(subject).apply_rules).
      to eq(answer)
    end

    subject2 =  [["#",".","#","#",".","#","#",".","#","#"],
                ["#","#","#","#","#","#","#",".","#","#"],
                ["#",".","#",".","#",".",".","#",".","."],
                ["#","#","#","#",".","#","#",".","#","#"],
                ["#",".","#","#",".","#","#",".","#","#"],
                ["#",".","#","#","#","#","#",".","#","#"],
                [".",".","#",".","#",".",".",".",".","."],
                ["#","#","#","#","#","#","#","#","#","#"],
                ["#",".","#","#","#","#","#","#",".","#"],
                ["#",".","#","#","#","#","#",".","#","#"]]

    answer2 =  [["#",".","L","L",".","L","#",".","#","#"],
              ["#","L","L","L","L","L","L",".","L","#"],
              ["L",".","L",".","L",".",".","L",".","."],
              ["#","L","L","L",".","L","L",".","L","#"],
              ["#",".","L","L",".","L","L",".","L","L"],
              ["#",".","L","L","L","L","#",".","#","#"],
              [".",".","L",".","L",".",".",".",".","."],
              ["#","L","L","L","L","L","L","L","L","#"],
              ["#",".","L","L","L","L","L","L",".","L"],
              ["#",".","#","L","L","L","L",".","#","#"]]

    it "returns #{answer2} for #{subject2}" do
      expect(SeatingSystem.new(subject2).apply_rules).
      to eq(answer2)
    end
  end

  context "#solve_seating" do

    it "returns #L#,#L# for LLL,LLL" do
      expect(SeatingSystem.new([["L","L","L"],["L","L","L"]]).solve_seating).
      to eq([["#","L","#"],["#","L","#"]])
    end

    subject = [["L",".","L","L",".","L","L",".","L","L"],
            ["L","L","L","L","L","L","L",".","L","L"],
            ["L",".","L",".","L",".",".","L",".","."],
            ["L","L","L","L",".","L","L",".","L","L"],
            ["L",".","L","L",".","L","L",".","L","L"],
            ["L",".","L","L","L","L","L",".","L","L"],
            [".",".","L",".","L",".",".",".",".","."],
            ["L","L","L","L","L","L","L","L","L","L"],
            ["L",".","L","L","L","L","L","L",".","L"],
            ["L",".","L","L","L","L","L",".","L","L"]]

    answer = [["#",".","#","L",".","L","#",".","#","#"],
            ["#","L","L","L","#","L","L",".","L","#"],
            ["L",".","#",".","L",".",".","#",".","."],
            ["#","L","#","#",".","#","#",".","L","#"],
            ["#",".","#","L",".","L","L",".","L","L"],
            ["#",".","#","L","#","L","#",".","#","#"],
            [".",".","L",".","L",".",".",".",".","."],
            ["#","L","#","L","#","#","L","#","L","#"],
            ["#",".","L","L","L","L","L","L",".","L"],
            ["#",".","#","L","#","L","#",".","#","#"]]

    it "returns #L#,#L# for LLL,LLL" do
      expect(SeatingSystem.new(subject).solve_seating).
      to eq(answer)
    end
  end

  context "#find_visibles" do

    it "returns [] for L. and 0,0" do
      expect(SeatingSystem.new([["L","."]]).find_visibles([0,0])).
      to eq([])
    end

    it "returns [#] for L# and 0,0" do
      expect(SeatingSystem.new([["L","#"]]).find_visibles([0,0])).
      to eq(["#"])
    end

    it "returns [#] for L...# and 0,0" do
      expect(SeatingSystem.new([["L",".",".",".","#"]]).find_visibles([0,0])).
      to eq(["#"])
    end

    it "returns [L] for L...L and 0,0" do
      expect(SeatingSystem.new([["L",".",".",".","L"]]).find_visibles([0,0])).
      to eq(["L"])
    end

    it "returns [L] for L.L.. and 0,0" do
      expect(SeatingSystem.new([["L",".","L",".","."]]).find_visibles([0,2])).
      to eq(["L"])
    end
  end

end
