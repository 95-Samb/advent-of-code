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
    it "returns 3 for B)C,A)B" do
      expect(Orbits.new.execute(["B)C","A)B"])).to eq(3)
    end
    it "returns 3 for B)C,A)B,A)BB,A)BBB,B)CC" do
      expect(Orbits.new.execute(["B)C","A)B","A)BB","A)BBB","B)CC"])).to eq(7)
    end
  end
  context "for the orbit_logic method" do
    it "returns [A,B] for A and A)B" do
      expect(Orbits.new.orbit_logic("A",["A)B"])).to eq(["A",["B"]])
    end
    it "returns [A,B,C] for A and A)B,B)C" do
      expect(Orbits.new.orbit_logic("A",["A)B","B)C"])).to eq(["A",["B"],["C"]])
    end
    it "returns [A,B,D] for A)B,B)D" do
      expect(Orbits.new.orbit_logic("A",["A)B","A)D"])).to eq(["A",["B","D"]])
    end
    it "returns [A,BC] for A and A)B,A)C" do
      expect(Orbits.new.orbit_logic("A",["A)B","A)C"])).to eq(["A",["B","C"]])
    end
    it "returns [A,BC,D] for A and A)B,A)C,C)D" do
      expect(Orbits.new.orbit_logic("A",["A)B","A)C","C)D"])).to eq(["A",["B","C"],["D"]])
    end
    it "returns [A,BC,D] for A and A)B,A)C,C)D" do
      expect(Orbits.new.orbit_logic("A",["A)C","A)B","C)D"])).to eq(["A",["C","B"],["D"]])
    end
    it "returns [A,[B,BB,BBB],[C,CC]] for A and B)C,A)B,A)BB,A)BBB,B)CC" do
      expect(Orbits.new.orbit_logic("A",["B)C","A)B","A)BB","A)BBB","B)CC"])).to eq(["A",["B","BB","BBB"],["C","CC"]])
    end
    it "returns [A,BCD,E] for A and A)B,A)C,A)D,D)E" do
      expect(Orbits.new.orbit_logic("A",["A)C","A)B","A)D","D)E"])).to eq(["A",["C","B","D"],["E"]])
    end
  end

  context "for the centre point method" do
    it "returns A for A)B" do
      expect(Orbits.new.centre_point(["A)B"])).to eq("A")
    end
    it "returns B for B)A,B)C" do
      expect(Orbits.new.centre_point(["B)A","B)C"])).to eq("B")
    end
    it "returns A for B)C,A)B" do
      expect(Orbits.new.centre_point(["B)C","A)B"])).to eq("A")
    end
    it "returns AC for AC)BC" do
      expect(Orbits.new.centre_point(["AC)BC"])).to eq("AC")
    end
  end
  context "for the orbiting_of_point method" do
    it "returns B for A)B and A " do
      expect(Orbits.new.orbiting_of_point("A",["A)B"])).
      to contain_exactly("B")
    end
    it "returns B,C for A)B,A)C and A " do
      expect(Orbits.new.orbiting_of_point("A",["A)B","A)C"])).
      to contain_exactly("B","C")
    end
    it "returns B for A)B,B)C and A " do
      expect(Orbits.new.orbiting_of_point("A",["A)B","B)C"])).
      to contain_exactly("B")
    end
    it "returns for AC)BC,BC)CC and A " do
      expect(Orbits.new.orbiting_of_point("A",["AC)BC","BC)CC"])).
      to contain_exactly()
    end
    it "returns AAA,BBB,CCC for COM)AAA,COM)BBB,COM)CCC and COM " do
      expect(Orbits.new.orbiting_of_point("COM",["COM)AAA","COM)BBB","COM)CCC"])).
      to contain_exactly("AAA","BBB","CCC")
    end
    it "returns for B)C,B)CC and B " do
      expect(Orbits.new.orbiting_of_point("B",["B)C","B)CC"])).
      to contain_exactly("C","CC")
    end
  end
  context "for the point of orbit method"do
    it "returns A for B and A)B" do
      expect(Orbits.new.point_of_orbit("B",["A)B"])).
      to eq("A")
    end
    it "returns B for C and B)C" do
      expect(Orbits.new.point_of_orbit("C",["B)C"])).
      to eq("B")
    end
    it "returns blank for C and B)A" do
      expect(Orbits.new.point_of_orbit("C",["B)A"])).
      to eq(nil)
    end
    it "returns A for B and A)C,A)B" do
      expect(Orbits.new.point_of_orbit("B",["A)C","A)B"])).
      to eq("A")
    end
    it "returns A for B and A)C,B)D,C)E,A)B" do
      expect(Orbits.new.point_of_orbit("B",["A)C","B)D","C)E","A)B"])).
      to eq("A")
    end
    it "returns B for C and B)C,B)D,C)E,A)B" do
      expect(Orbits.new.point_of_orbit("C",["B)C","B)D","C)E","A)B"])).
      to eq("B")
    end
    it "returns BB for CCC and BB)CCC,BB)CC,CC)E,A)BB" do
      expect(Orbits.new.point_of_orbit("CCC",["BB)CCC","BB)CC","CC)E","A)BB"])).
      to eq("BB")
    end
  end
  context "for the single orbit logic method" do
    it "returns B,A for C and B)C,A)B" do
      expect(Orbits.new.single_orbit_logic("C",["B)C","A)B"])).
      to eq(["B","A"])
    end
    it "returns B,C for A and B)A,C)B" do
      expect(Orbits.new.single_orbit_logic("A",["B)A","C)B"])).
      to eq(["B","C"])
    end
    it "returns B,C for A and B)A,C)B,B)D" do
      expect(Orbits.new.single_orbit_logic("A",["B)A","C)B","B)D"])).
      to eq(["B","C"])
    end
    it "returns B,C,D for A and B)A,C)B,D)C" do
      expect(Orbits.new.single_orbit_logic("A",["B)A","C)B","D)C"])).
      to eq(["B","C","D"])
    end
  end
  context "for the orbit transfers method" do
    it "returns 0 for A,B,[C)A,C)B]" do
      expect(Orbits.new.orbit_transfers("A","B",["C)A","C)B"])).to eq(0)
    end
    it "returns 1 for A,B,[C)A,D)B,C)D]" do
      expect(Orbits.new.orbit_transfers("A","B",["C)A","D)B","C)D"])).to eq(1)
    end
    it "returns 1 for A,E,[C)A,D)E,C)D]" do
      expect(Orbits.new.orbit_transfers("A","E",["C)A","D)E","C)D"])).to eq(1)
    end
  end
end
