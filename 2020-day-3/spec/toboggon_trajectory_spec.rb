require_relative "../toboggan_trajectory"

describe TobogganTrajectory do
  context "for trees hit method with down 1, right 3" do
    it "returns 0 for ....,...." do
      expect(TobogganTrajectory.new.trees_hit(["....","...."],1,3)).to eq(0)
    end
    it "returns 1 for ....,...#" do
      expect(TobogganTrajectory.new.trees_hit(["....","...#"],1,3)).to eq(1)
    end
    it "returns 0 for ....,....,...." do
      expect(TobogganTrajectory.new.trees_hit(["....","....","...."],1,3)).to eq(0)
    end
    it "returns 1 for ........,........,......#" do
      expect(TobogganTrajectory.new.trees_hit(
        ["...." * 2 ,"...." * 2,"......#"],1,3)).to eq(1)
    end
    it "returns 0 for ....,...." do
      expect(TobogganTrajectory.new.trees_hit(
        ["...." ,"...." ],1,3)).to eq(0)
    end
    it "returns 1 for ...,...,#.." do
      expect(TobogganTrajectory.new.trees_hit(
        ["..." ,"...","#.." ],1,3)).to eq(1)
    end
    it "returns 2 for ...,#..,#.." do
      expect(TobogganTrajectory.new.trees_hit(
        ["..." ,"#..","#.." ],1,3)).to eq(2)
    end
    it "returns 7 for given input" do
      expect(TobogganTrajectory.new.trees_hit(
        ["..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#"],1,3)).to eq(7)
    end
  end

  context "for trees hit method with down 1 right 1" do
    it "returns 2 for ...,.#.,..#" do
      expect(TobogganTrajectory.new.trees_hit(["...",".#.","..#"],1,1)).to eq(2)
    end
  end

  context "for least trees hit method" do
    it "returns 336 for given inputs" do
      expect(TobogganTrajectory.new.total_trees_hit(["..##.......",
        "#...#...#..",
        ".#....#..#.",
        "..#.#...#.#",
        ".#...##..#.",
        "..#.##.....",
        ".#.#.#....#",
        ".#........#",
        "#.##...#...",
        "#...##....#",
        ".#..#...#.#"],[[1,1],[1,3],[1,5],[1,7],[2,1]])). to eq(336)
    end
  end



end
