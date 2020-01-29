require_relative "../manhattan_distance"

describe ManhattanDistance do
  it "returns nil for [[R1],[L1]]" do
    expect(ManhattanDistance.new.execute([["R1"],["L1"]])).to eq(nil)
  end
end
