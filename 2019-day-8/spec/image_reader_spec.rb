require_relative "../image_reader.rb"

describe ImageReader do
  context "for a single layer" do
    context "for layers method with width 3 and height 1" do
      it "returns 123 for 123" do
        expect(ImageReader.new(3,1).layers("123")).to eq([["123"]])
      end
      it "returns 987 for 987" do
        expect(ImageReader.new(3,1).layers("987")).to eq([["987"]])
      end
    end
    context "for layers method with width 2 and height 2" do
      it "returns 12,34 for 12,34" do
        expect(ImageReader.new(2,2).layers("1234")).to eq([["12","34"]])
      end
      it "returns 12,34 for 12,34" do
        expect(ImageReader.new(2,2).layers("9876")).to eq([["98","76"]])
      end
    end
    context "for layers method with width 7 and height 6" do
      it "returns 12,34 for 12,34" do
        code = "1234567234567834567894567890567890167890127890123"
        expect(ImageReader.new(7,6).layers(code)).to eq([["1234567",
                                                          "2345678",
                                                          "3456789",
                                                          "4567890",
                                                          "5678901",
                                                          "6789012",
                                                          "7890123"]])
      end
    end
  end
end
