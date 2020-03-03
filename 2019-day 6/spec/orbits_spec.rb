require_relative "../orbits"

describe Orbits do
  it "returns 1 for A)B" do
    expect(Orbits.new.execute(["A)B"])).to eq(1)
  end
  it "returns 2 for A)B,A)C" do
    expect(Orbits.new.execute(["A)B","A)C"])).to eq(2)
  end
end
