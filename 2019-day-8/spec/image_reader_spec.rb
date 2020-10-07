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
                                                          "6789012"]])
      end
    end
  end
  context "for two layers" do
    context "for layers method with width 2 and height 2" do
      it "returns [12,34],[56,78] for 12345678" do
        expect(ImageReader.new(2,2).layers("12345678")).to eq([["12","34"],["56","78"]])
      end
      it "returns [11,11],[22,22] for 11112222" do
        expect(ImageReader.new(2,2).layers("11112222")).to eq([["11","11"],["22","22"]])
      end
    end
    context "for layers method with width 5 and height 3" do
      it "returns [12345,54321,12345],[98765,56789,98765] for 123455432112345987655678998765" do
        layers = "123455432112345987655678998765"
        expect(ImageReader.new(5,3).layers(layers)).to eq(
          [["12345","54321","12345"],["98765","56789","98765"]])
      end
    end
  end
end
