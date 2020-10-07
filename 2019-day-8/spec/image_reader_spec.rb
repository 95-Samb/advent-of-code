require_relative "../image_reader.rb"

describe ImageReader do
  context "for layers method with width 3 and height 1" do
    it "returns 123 for 123" do
      expect(ImageReader.new(3,1).layers("123")).to eq([[123]])
    end
    it "returns 987 for 987" do
      expect(ImageReader.new(3,1).layers("987")).to eq([[987]])
    end
  end
end
