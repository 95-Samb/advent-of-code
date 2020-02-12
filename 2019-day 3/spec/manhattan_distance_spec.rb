require_relative "../manhattan_distance"

describe ManhattanDistance do
  context "for execute method" do
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
      expect(ManhattanDistance.new.route(["0","0"],"R1")).to eq([[1,0]])
    end
    it "returns [1,0] upto [9,0] for [0,0] & R9" do
      expect(ManhattanDistance.new.route(["0","0"],"R9")).to eq([[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0]])
    end
    it "returns [5,3] upto [9,3] for [4,3] & R5" do
      expect(ManhattanDistance.new.route(["4","3"],"R5")).to eq([[5,3],[6,3],[7,3],[8,3],[9,3]])
    end
    it "returns [2,3] upto [2,7] for [2,2] & U5" do
      expect(ManhattanDistance.new.route(["2","2"],"U5")).to eq([[2,3],[2,4],[2,5],[2,6],[2,7]])
    end
    it "returns [2,1] upto [2,-1] for [2,2] & D3" do
      expect(ManhattanDistance.new.route(["2","2"],"D3")).to eq([[2,1],[2,0],[2,-1]])
    end
    it "returns [1,2] upto [-1,2] for [2,2] & L3" do
      expect(ManhattanDistance.new.route(["2","2"],"L3")).to eq([[1,2],[0,2],[-1,2]])
    end
    it "returns [1,0] upto [1,-1] for [1,1] & D2" do
      expect(ManhattanDistance.new.route(["1","1"],"D2")).to eq([[1,0],[1,-1]])
    end
  end

  context "for all_points method" do
    it "returns [[[1,0],[1,1]],[[0,1],[1,1]]] for ['R1,U1','U1,R1']" do
      expect(ManhattanDistance.new.all_points(['R1,U1','U1,R1'])).to eq(
      [[[1,0],[1,1]],[[0,1],[1,1]]])
    end
    it "returns [[[1,0],[1,1],[1,0],[1,-1]],[[0,1],[1,1],[1,2],[1,3]]] for ['R1,U1,D3','U1,R1,U3']" do
      expect(ManhattanDistance.new.all_points(['R1,U1,D3','U1,R1,U3'])).to eq(
      [[[1,0],[1,1],[1,0],[1,-1],[1,-2]],[[0,1],[1,1],[1,2],[1,3],[1,4]]])
    end
  end

  context "for distance_manhattan method" do
    it "returns [1] for [[1,0]]" do
      expect(ManhattanDistance.new.distance_manhattan([[1,0]])).to eq([1])
    end
    it "returns [2] for [[1,1]]" do
      expect(ManhattanDistance.new.distance_manhattan([[1,1]])).to eq([2])
    end
    it "returns [1,2] for [[1,0],[1,1]]" do
      expect(ManhattanDistance.new.distance_manhattan([[1,0],[1,1]])).to eq([1,2])
    end
  end
end
