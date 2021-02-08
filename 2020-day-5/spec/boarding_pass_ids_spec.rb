require_relative "../boarding_pass_ids"

describe BoardingPassIds do
  context "for a single boarding pass" do
    it "returns 5 for FFFFFFFLLL" do
      expect(BoardingPassIds.new.execute(["FFFFFFFLLL"])).to eq([0])
    end
    it "returns 512 for BFFFFFFLLL" do
      expect(BoardingPassIds.new.execute(["BFFFFFFLLL"])).to eq([512])
    end
    it "returns 513 for BFFFFFFLLR" do
      expect(BoardingPassIds.new.execute(["BFFFFFFLLR"])).to eq([513])
    end
  end
  context "for multiple boarding passes" do
    it "returns 5,512 for FFFFFFFLLL,BFFFFFFLLL" do
      expect(BoardingPassIds.new.execute(["FFFFFFFLLL","BFFFFFFLLL"])).to eq([0,512])
    end
    it "returns 5,512,513 for FFFFFFFLLL,BFFFFFFLLL,BFFFFFFLLR" do
      expect(BoardingPassIds.new.execute(["FFFFFFFLLL","BFFFFFFLLL","BFFFFFFLLR"])).
      to eq([0,512,513])
    end
  end
end
