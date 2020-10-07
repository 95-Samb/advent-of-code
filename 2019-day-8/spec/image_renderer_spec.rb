require_relative "../image_renderer.rb"

describe ImageRenderer do
  context "for two layers" do
    it "returns 0 for 0 and 0" do
      expect(ImageRenderer.new.decode([["0"],["0"]])).to eq(["0"])
    end
    it "returns 1 for 1 and 0" do
      expect(ImageRenderer.new.decode([["1"],["0"]])).to eq(["1"])
    end
    it "returns 1,0 for 1,1 and 0,1" do
      expect(ImageRenderer.new.decode([["1","1"],["0","1"]])).to eq(["1","1"])
    end
    xit "returns 1,1 for 2,1 and 1,0" do
      expect(ImageRenderer.new.decode([["2","1"],["1","0"]])).to eq(["1","1"])
    end
  end
end
