require_relative "../noun_verb_finder"

describe NounVerbFinder do
  it "returns 0,0 for opcode 1,0,0,0,99 and output 2" do
    expect(NounVerbFinder.new.execute([1,0,0,0,99], 2)).to eq([0,0])
  end
  it "returns 2,2 for opcode 1,0,0,0,99 and output 4" do
    expect(NounVerbFinder.new.execute([1,0,0,0,99], 4)).to eq([2,2])
  end
  it "returns 0,0 for opcode 2,0,0,0,99 and output 4" do
    expect(NounVerbFinder.new.execute([2,0,0,0,99], 4)).to eq([0,0])
  end
  xit "returns 0,2 for opcode 1,0,0,0,99 and output 3" do
    expect(NounVerbFinder.new.execute([1,0,0,0,99], 3)).to eq([0,2])
  end

end
