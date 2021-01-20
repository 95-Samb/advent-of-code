require_relative "../toboggan_trajectory"

describe TobogganTrajectory do
  it "returns 0 for ....,...." do
    expect(TobogganTrajectory.new.execute(["....","...."])).to eq(0)
  end
  it "returns 1 for ....,...#" do
    expect(TobogganTrajectory.new.execute(["....","...#"])).to eq(1)
  end
  it "returns 0 for ....,....,...." do
    expect(TobogganTrajectory.new.execute(["....","....","...."])).to eq(0)
  end
  it "returns 1 for ........,........,......#" do
    expect(TobogganTrajectory.new.execute(
      ["...." * 2 ,"...." * 2,"......#"])).to eq(1)
  end
  it "returns 0 for ....,...." do
    expect(TobogganTrajectory.new.execute(
      ["...." ,"...." ])).to eq(0)
  end
  it "returns 1 for ...,...,#.." do
    expect(TobogganTrajectory.new.execute(
      ["..." ,"...","#.." ])).to eq(1)
  end
  it "returns 2 for ...,#..,#.." do
    expect(TobogganTrajectory.new.execute(
      ["..." ,"#..","#.." ])).to eq(2)
  end
  it "returns 7 for given input" do
    expect(TobogganTrajectory.new.execute(
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
      ".#..#...#.#"])).to eq(7)
  end

end
