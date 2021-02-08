require_relative "../boarding_pass"

describe BoardingPass do
  context "for row identify function" do
    it "returns 0 for FFFFFFFLLL" do
      expect(BoardingPass.new("FFFFFFFLLL").row_identify).to eq(0)
    end
    it "returns 64 for BFFFFFFLLL" do
      expect(BoardingPass.new("BFFFFFFLLL").row_identify).to eq(64)
    end
    it "returns 96 for BBFFFFFLLL" do
      expect(BoardingPass.new("BBFFFFFLLL").row_identify).to eq(96)
    end
    it "returns 112 for BBBFFFFLLL" do
      expect(BoardingPass.new("BBBFFFFLLL").row_identify).to eq(112)
    end
    it "returns 32 for FBFFFFFLLL" do
      expect(BoardingPass.new("FBFFFFFLLL").row_identify).to eq(32)
    end
    it "returns 63 for FBBBBBBLLL" do
      expect(BoardingPass.new("FBBBBBBLLL").row_identify).to eq(63)
    end
    it "returns 62 for FBBBBBFLLL" do
      expect(BoardingPass.new("FBBBBBFLLL").row_identify).to eq(62)
    end
  end

  context "for column identify function" do
    it "returns 0 for FFFFFFFLLL" do
      expect(BoardingPass.new("FFFFFFFLLL").column_identify).to eq(0)
    end
    it "returns 1 for FFFFFFFLLR" do
      expect(BoardingPass.new("FFFFFFFLLR").column_identify).to eq(1)
    end
    it "returns 3 for FFFFFFFLRR" do
      expect(BoardingPass.new("FFFFFFFLRR").column_identify).to eq(3)
    end
  end

end
