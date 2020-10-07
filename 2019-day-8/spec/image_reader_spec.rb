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
  context "for multiple layers" do
    context "for layers method with width 1 and height 1" do
      it "returns [1],[2],[3] for 123" do
        expect(ImageReader.new(1,1).layers("123")).to eq([["1"],["2"],["3"]])
      end
      it "returns [9],[8],[7],[6],[5],[4],[3],[2],[1] for 987654321" do
        expect(ImageReader.new(1,1).layers("987654321")).to eq(
          [["9"],["8"],["7"],["6"],["5"],["4"],["3"],["2"],["1"]])
      end
    end
    context "for layers method with width 3 and height 2" do
      it "returns [123,321],[456,654],[789,987] for 123321456654789987" do
        expect(ImageReader.new(3,2).layers("123321456654789987")).to eq(
          [["123","321"],["456","654"],["789","987"]])
      end
    end
  end
  context "for fewest digit method" do
    it "returns 111 for 2 and 111,222" do
      expect(ImageReader.new(3,1).fewest_digit("2",[["111"],["222"]])). to eq(["111"])
    end
    it "returns 1,1,1 for 2 and [1,1,1],[2,2,2]" do
      expect(ImageReader.new(3,1).fewest_digit("2",[["1","1","1"],["2","2","2"]])). to eq(["1","1","1"])
    end
    it "returns 222 for 1 and 111,222" do
      expect(ImageReader.new(3,1).fewest_digit("1",[["111"],["222"]])). to eq(["222"])
    end
    it "returns for 121 for 2 and 121,222,223,272" do
      expect(ImageReader.new(3,1).fewest_digit("2",[["121"],["222"],["223"],["272"]])). to eq(["121"])
    end
    it "returns for 1,2,1 for 2 and [1,2,1],[2,2,2],[2,2,3],[2,7,2]" do
      expect(ImageReader.new(3,1).fewest_digit("2",[["1","2","1"],["2","2","2"],
                                                    ["2","2","3"],["2","7","2"]])). to eq(["1","2","1"])
    end
  end
  context "for layer digit count multiplier method" do
    it "returns 2 for 122 and 1,2 " do
      expect(ImageReader.new(1,1).layer_digit_count_multiplier("1","2",["122"])).to eq(2)
    end
    it "returns 3 for 1222 and 1,2 " do
      expect(ImageReader.new(1,1).layer_digit_count_multiplier("1","2",["1222"])).to eq(3)
    end
    it "returns 2 for [1,2,2] and 1,2 " do
      expect(ImageReader.new(1,1).layer_digit_count_multiplier("1","2",["1","2","2"])).to eq(2)
    end
    it "returns 2 for 1223334444 and 1,2 " do
      expect(ImageReader.new(1,1).layer_digit_count_multiplier("1","2",["1223334444"])).to eq(2)
    end
    it "returns 3 for 1223334444 and 1,3 " do
      expect(ImageReader.new(1,1).layer_digit_count_multiplier("1","3",["1223334444"])).to eq(3)
    end
    it "returns 6 for 1223334444 and 2,3 " do
      expect(ImageReader.new(1,1).layer_digit_count_multiplier("2","3",["1223334444"])).to eq(6)
    end
    it "returns 12 for 1223334444 and 4,3 " do
      expect(ImageReader.new(1,1).layer_digit_count_multiplier("4","3",["1223334444"])).to eq(12)
    end
  end
end
