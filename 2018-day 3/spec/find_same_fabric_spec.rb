require_relative "../find_same_fabric"

describe FindSameFabric do
  it "responds" do
    expect(FindSameFabric.new.execute("")).to eq(nil)
  end
  it "responds with nil to [#1 @ 0,0: 1x1]" do
    expect(FindSameFabric.new.execute(["#1 @ 0,0: 1x1"])).to eq(nil)
  end
  it "responds with 1 to [#1 @ 0,0: 1x1,#2 @ 0,0: 2x2" do
    expect(FindSameFabric.new.execute(["#1 @ 0,0: 1x1","#2 @ 0,0: 2x2"])).to eq(1)
  end
  xit "responds with 1 to [#1 @ 1,1: 1x1,#2 @ 0,0: 2x2" do
    expect(FindSameFabric.new.execute(["#1 @ 1,1: 1x1","#2 @ 0,0: 2x2"])).to eq(1)
  end
end




