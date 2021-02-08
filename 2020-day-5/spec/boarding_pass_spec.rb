require_relative "../boarding_pass"

describe BoardingPass do
  context "for row identify function" do
    it "returns 0 for FFFFFFFLLL" do
      expect(BoardingPass.new("FFFFFFFLLL").row_identify).to eq(0)
    end
  end
end
