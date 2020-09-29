require_relative "../intcode_instructions"

describe IntcodeInstructions do
  context "for simple instructions" do
    it "returns [1,0,0,5,99,2] for 1,0,[1,0,0,5,99,0],[1,1]" do
      expect(IntcodeInstructions.new.execute(1,0,[1,0,0,5,99,0],[1,1])).to eq(:intcode => [1,0,0,5,99,2],:pointer => 4)
    end
    it "returns [2,0,0,5,99,4] for 1,0,[2,0,0,5,99,0],[2,2]" do
      expect(IntcodeInstructions.new.execute(2,0,[2,0,0,5,99,0],[2,2])).to eq(:intcode => [2,0,0,5,99,4],:pointer => 4)
    end
    it "returns [7,1,0,5,99,1] for 7,0,[7,1,0,5,99,0],[1,7]" do
      expect(IntcodeInstructions.new.execute(7,0,[7,1,0,5,99,0],[1,7])).to eq(:intcode => [7,1,0,5,99,1],:pointer => 4)
    end
    it "returns [8,1,0,5,99,0] for 8,0,[8,1,0,5,99,0],[1,8]" do
      expect(IntcodeInstructions.new.execute(8,0,[8,1,0,5,99,0],[1,8])).to eq(:intcode => [8,1,0,5,99,0],:pointer => 4)
    end
  end
end
