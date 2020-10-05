require_relative "../instruction_parameters"

describe InstructionParameters  do
  context "for all position mode parameters" do
    it "returns [1,2] for 1,0 and [1,2,1,0,99]" do
      expect(InstructionParameters.new.identify(1.digits,0,[1,2,1,0,99])).to eq([1,2])
    end
    it "returns [2,0] for 2,0 and [2,0,1,0,99]" do
      expect(InstructionParameters.new.identify(2.digits,0,[2,0,1,0,99])).to eq([2,0])
    end
    it "returns [7,0] for 7,0 and [7,0,1,0,99]" do
      expect(InstructionParameters.new.identify(7.digits,0,[7,0,1,0,99])).to eq([7,0])
    end
  end
  context "for all immediate mode parameters" do
    it "returns [2,1] for 1101,0 and [1101,2,1,0,99]" do
      expect(InstructionParameters.new.identify(1101.digits,0,[1101,2,1,0,99])).to eq([2,1])
    end
    it "returns [2,1] for 1102,0 and [1102,2,1,0,99]" do
      expect(InstructionParameters.new.identify(1102.digits,0,[1102,2,1,0,99])).to eq([2,1])
    end
    it "returns [0,1] for 1107,0 and [1107,0,1,0,99]" do
      expect(InstructionParameters.new.identify(1107.digits,0,[1107,0,1,0,99])).to eq([0,1])
    end
  end
  context "for mixed mode parameters" do
    it "returns [1,1] for 1001,0 and [1001,2,1,0,99]" do
      expect(InstructionParameters.new.identify(1001.digits,0,[1001,2,1,0,99])).to eq([1,1])
    end
    it "returns [1,1] for 1002,0 and [1002,2,1,0,99]" do
      expect(InstructionParameters.new.identify(1002.digits,0,[1002,2,1,0,99])).to eq([1,1])
    end
    it "returns [2,2] for 102,0 and [102,2,1,0,99]" do
      expect(InstructionParameters.new.identify(102.digits,0,[102,2,1,0,99])).to eq([2,2])
    end
  end

end
