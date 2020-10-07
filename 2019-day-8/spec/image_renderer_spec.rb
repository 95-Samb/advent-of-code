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
  context "for layer combiner" do
    it "returns 0 for 0 and 0" do
      expect(ImageRenderer.new.combine_layers(["0"],["0"])).to eq(["0"])
    end
    it "returns 1 for 1 and 0" do
      expect(ImageRenderer.new.combine_layers(["1"],["0"])).to eq(["1"])
    end
    it "returns 1,0 for 1,1 and 0,1" do
      expect(ImageRenderer.new.combine_layers(["1","1"],["0","1"])).to eq(["1","1"])
    end
    it "returns 1,1 for 2,1 and 1,0" do
      expect(ImageRenderer.new.combine_layers(["2","1"],["1","0"])).to eq(["1","1"])
    end
    it "returns 1,1 for 2,1 and 1,0" do
      expect(ImageRenderer.new.combine_layers(["2","1"],["1","0"])).to eq(["1","1"])
    end
    it "returns 10,11 for 20,11 and 11,01" do
      expect(ImageRenderer.new.combine_layers(["20","11"],["11","01"])).to eq(["10","11"])
    end
    it "returns 00,11 for 20,11 and 01,01" do
      expect(ImageRenderer.new.combine_layers(["20","11"],["01","01"])).to eq(["00","11"])
    end
  end
end
