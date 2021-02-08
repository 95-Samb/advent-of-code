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
  end
end
