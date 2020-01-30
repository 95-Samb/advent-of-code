require_relative "../manhattan_distance"

describe ManhattanDistance do
  xcontext "for execute method" do
    it "returns nil for ['R1','L1']" do
      expect(ManhattanDistance.new.execute(["R1","L1"])).to eq(nil)
    end
    it "returns 2 for ['R1,U1','U1,R1']" do
      expect(ManhattanDistance.new.execute(["R1,U1","U1,R1"])).to eq(2)
    end
    it "returns 1 for ['R1,U1,L1','U1']" do
      expect(ManhattanDistance.new.execute(["R1,U1,L1","U1"])).to eq(1)
    end
  end
  context "for route method" do
    it "returns [1,0] for [0,0] & R1" do
      expect(ManhattanDistance.new.route(["0","0"],"R1")).to eq([1,0])
    end
    it "returns [9,0] for [0,0] & R9" do
      expect(ManhattanDistance.new.route(["0","0"],"R9")).to eq([9,0])
    end
    it "returns [9,3] for [4,3] & R5" do
      expect(ManhattanDistance.new.route(["4","3"],"R5")).to eq([9,3])
    end
    it "returns [2,7] for [2,2] & U5" do
      expect(ManhattanDistance.new.route(["2","2"],"U5")).to eq([2,7])
    end
    it "returns [2,-1] for [2,2] & D3" do
      expect(ManhattanDistance.new.route(["2","2"],"D3")).to eq([2,-1])
    end
    it "returns [-1,2] for [2,2] & L3" do
      expect(ManhattanDistance.new.route(["2","2"],"L3")).to eq([-1,2])
    end
  end
end
