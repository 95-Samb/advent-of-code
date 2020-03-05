require_relative "../orbits"

describe Orbits do
  context "for the execute method" do
    it "returns 1 for A)B" do
      expect(Orbits.new.execute(["A)B"])).to eq(1)
    end
    it "returns 2 for A)B,A)C" do
      expect(Orbits.new.execute(["A)B","A)C"])).to eq(2)
    end
    it "returns 3 for A)B,B)C" do
      expect(Orbits.new.execute(["A)B","B)C"])).to eq(3)
    end
    xit "returns 3 for B)C,A)B" do
      expect(Orbits.new.execute(["B)C","A)B"])).to eq(3)
    end
  end
  xcontext "for the orbit_logic method" do
    it "returns [A,B] for A)B" do
      expect(Orbits.new.orbit_logic(["A)B"])).to eq(["A","B"])
    end
    it "returns [A,B,C] for A)B,B)C" do
      expect(Orbits.new.orbit_logic(["A)B","A)C"])).to eq(["A","B","C"])
    end
    it "returns [A,B,D] for A)B,B)D" do
      expect(Orbits.new.orbit_logic(["A)B","A)D"])).to eq(["A","B","D"])
    end
    it "returns [A,BC] for A)B,A)C" do
      expect(Orbits.new.orbit_logic(["A)B","A)C"])).to eq(["A","BC"])
    end
  end
  context "for the all_orbiters method " do
    it "returns [A,B] for A)B" do
      expect(Orbits.new.all_orbiters(["A)B"])[0]).to eq(["A","B"])
    end
    it "returns [A,B,C] for A)B,B)C" do
      expect(Orbits.new.all_orbiters(["A)B","B)C"])[0]).to eq(["A","B","C"])
    end
    it "returns [A,B,C] for A)B,A)C" do
      expect(Orbits.new.all_orbiters(["A)B","A)C"])[0]).to eq(["A","B","C"])
    end
    it "returns [A,B,C,D] for A)B,A)C,B)D" do
      expect(Orbits.new.all_orbiters(["A)B","A)C","B)D"])[0]).to eq(["A","B","C","D"])
    end
    it "returns [A,B,C,D,E] for A)B,A)C,B)D,A)E" do
      expect(Orbits.new.all_orbiters(["A)B","A)C","B)D","A)E"])[0]).to eq(["A","B","C","D","E"])
    end
    it "returns [AB,BC] for AB)BC" do
      expect(Orbits.new.all_orbiters(["AB)BC"])[0]).to contain_exactly("AB","BC")
    end
    it "returns [AB,AC,AE,BC,BD,CB,DE,EC] for AB)BC,AC)CB,BD)DE,AE)EC" do
      expect(Orbits.new.all_orbiters(["AB)BC","AC)CB","BD)DE","AE)EC"])[0]).
      to contain_exactly("AB","AC","AE","BC","BD","CB","DE","EC")
    end

  end
  context "for the centre point part of all_orbiters method" do
    it "returns A for A)B" do
      expect(Orbits.new.all_orbiters(["A)B"])[1]).to eq("A")
    end
    it "returns B for B)A,B)C" do
      expect(Orbits.new.all_orbiters(["B)A","B)C"])[1]).to eq("B")
    end
    it "returns A for B)C,A)B" do
      expect(Orbits.new.all_orbiters(["B)C","A)B"])[1]).to eq("A")
    end
    it "returns AC for AC)BC" do
      expect(Orbits.new.all_orbiters(["AC)BC"])[1]).to eq("AC")
    end
  end
end
