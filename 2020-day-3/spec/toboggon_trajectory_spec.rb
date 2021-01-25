require_relative "../toboggan_trajectory"

describe TobogganTrajectory do
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
