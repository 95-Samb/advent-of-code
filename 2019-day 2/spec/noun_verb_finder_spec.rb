require_relative "../noun_verb_finder"

describe NounVerbFinder do
  context "for single 4 opcode" do
    it "returns 0,0 for opcode 1,0,0,0,99 and output 2" do
      expect(NounVerbFinder.new.execute([1,0,0,0,99], 2)).to eq([0,0])
    end
    it "returns 0,0 for opcode 1,2,3,0,99 and output 2" do
      expect(NounVerbFinder.new.execute([1,2,3,0,99], 2)).to eq([0,0])
    end
    it "returns 2,2 for opcode 1,0,0,0,99 and output 4" do
      expect(NounVerbFinder.new.execute([1,0,0,0,99], 4)).to eq([2,2])
    end
    it "returns 0,0 for opcode 2,0,0,0,99 and output 4" do
      expect(NounVerbFinder.new.execute([2,0,0,0,99], 4)).to eq([0,0])
    end
    it "returns 0,2 for opcode 1,0,0,0,99 and output 3" do
      expect(NounVerbFinder.new.execute([1,0,0,0,99], 3)).to eq([0,2])
    end
    it "returns 0,1 for opcode 1,0,0,0,99 and output 1" do
      expect(NounVerbFinder.new.execute([1,0,0,0,99], 1)).to eq([0,1])
    end
    it "returns 1,0 for opcode 2,0,0,0,99 and output 2" do
      expect(NounVerbFinder.new.execute([2,0,0,0,99], 2)).to eq([1,0])
    end
    it "returns 1,0 for opcode 2,3,2,0,99 and output 2" do
      expect(NounVerbFinder.new.execute([2,3,2,0,99], 2)).to eq([1,0])
    end
    it "returns 1,0 for opcode 2,0,0,0,99 and output 2" do
      expect(NounVerbFinder.new.execute([2,0,0,0,99], 2)).to eq([1,0])
    end
  end
  it "returns 0,1 for opcode 1,0,0,0,1,0,0,0,99 and output 2" do
    expect(NounVerbFinder.new.execute([1,0,0,0,1,0,0,0,99], 2)).to eq([0,1])
  end
  it "returns 0,7 for opcode 1,0,0,0,1,0,0,4,99 and output 5" do
    expect(NounVerbFinder.new.execute([1,0,0,0,1,0,0,4,99], 5)).to eq([0,7])
  end
  it "returns 0,7 for opcode 2,0,0,0,2,0,0,3,99 and output 6" do
    expect(NounVerbFinder.new.execute([2,0,0,0,2,0,0,3,99], 6)).to eq([0,7])
  end
end
