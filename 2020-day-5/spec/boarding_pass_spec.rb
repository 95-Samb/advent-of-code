require_relative "../boarding_pass"

describe BoardingPass do

  context "for id method" do
    it "returns 5 for FFFFFFFLLL" do
      expect(BoardingPass.new("FFFFFFFLLL").id).to eq(0)
    end
    it "returns 512 for BFFFFFFLLL" do
      expect(BoardingPass.new("BFFFFFFLLL").id).to eq(512)
    end
    it "returns 513 for BFFFFFFLLR" do
      expect(BoardingPass.new("BFFFFFFLLR").id).to eq(513)
    end
    it "returns 1023 for BBBBBBBRRR" do
      expect(BoardingPass.new("BBBBBBBRRR").id).to eq(1023)
    end
    it "returns 906 for BBBFFFBLRL" do
      expect(BoardingPass.new("BBBFFFBLRL").id).to eq(906)
    end

  end

end
