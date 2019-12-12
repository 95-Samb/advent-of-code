require_relative "../find_same_fabric"

describe FindSameFabric do
  it "responds" do
    expect(FindSameFabric.new.execute("")).to eq(nil)
  end
end
