require_relative "../toboggan_trajectory"

describe TobogganTrajectory do
  it "returns 0 for ...,..." do
    expect(TobogganTrajectory.new.execute(["...","..."])).to eq(0)
  end
  it "returns 0 for ...,..#" do
    expect(TobogganTrajectory.new.execute(["...","..#"])).to eq(1)
  end

end
