require_relative "../new_intcode"

describe NewIntcode do
  context 'for a single 4 opcode before 99' do
    it 'returns 2,0,0,0,99 for 1,0,0,0,99' do
      expect(NewIntcode.new.execute(nil,[1, 0, 0, 0, 99])[0]).to eq([2, 0, 0, 0, 99])
    end
    it 'returns 2,1,0,0,99 for 1,1,0,0,99' do
      expect(NewIntcode.new.execute(nil,[1, 1, 0, 0, 99])[0]).to eq([2, 1, 0, 0, 99])
    end
    it 'returns 1,2,0,1,99 for 1,1,0,1,99' do
      expect(NewIntcode.new.execute(nil,[1, 1, 0, 1, 99])[0]).to eq([1, 2, 0, 1, 99])
    end
    it 'returns 2,1,0,0,99 for 2,1,0,0,99' do
      expect(NewIntcode.new.execute(nil,[2, 1, 0, 0, 99])[0]).to eq([2, 1, 0, 0, 99])
    end
    it 'returns 1,2,1,2,99 for 1,2,0,2,99' do
      expect(NewIntcode.new.execute(nil,[1, 2, 0, 2, 99])[0]).to eq([1, 2, 1, 2, 99])
    end
    it 'returns 2,2,6,2,99 for 2,2,3,2,99' do
      expect(NewIntcode.new.execute(nil,[2, 2, 3, 2, 99])[0]).to eq([2, 2, 6, 2, 99])
    end
    it 'returns 1,0,1,2,99,0 for 1,0,5,2,99,0' do
      expect(NewIntcode.new.execute(nil,[1, 0, 5, 2, 99, 0])[0]).to eq([1, 0, 1, 2, 99, 0])
    end
    it 'returns 1,6,2,2,99,0,2 for 1,6,5,2,99,0,2' do
      expect(NewIntcode.new.execute(nil,[1, 6, 5, 2, 99, 0, 2])[0]).to eq([1, 6, 2, 2, 99, 0, 2])
    end
  end
  context 'for a double opcode before 99' do
    it 'returns 2,4,0,0,1,0,0,1,99 for 1,0,0,0,1,0,0,1,99' do
      expect(NewIntcode.new.execute(nil,[1, 0, 0, 0, 1, 0, 0, 1, 99])[0]).to eq([2, 4, 0, 0, 1, 0, 0, 1, 99])
    end
    it 'returns 2,4,0,0,2,0,0,1,99 for 1,0,0,0,2,0,0,1,99' do
      expect(NewIntcode.new.execute(nil,[1, 0, 0, 0, 2, 0, 0, 1, 99])[0]).to eq([2, 4, 0, 0, 2, 0, 0, 1, 99])
    end
    it 'returns 1,1,1,0,2,0,0,1,99 for 1,0,1,0,2,0,0,1,99' do
      expect(NewIntcode.new.execute(nil,[1, 0, 1, 0, 2, 0, 0, 1, 99])[0]).to eq([1, 1, 1, 0, 2, 0, 0, 1, 99])
    end
    it 'returns 1,1,4,1,2,0,0,1,99 for 1,0,4,1,2,0,0,1,99' do
      expect(NewIntcode.new.execute(nil,[1, 0, 4, 1, 2, 0, 0, 1, 99])[0]).to eq([1, 1, 4, 1, 2, 0, 0, 1, 99])
    end
  end
  context 'for a triple opcode before 99' do
    it 'returns 4,8,0,0,1,0,0,0,1,0,0,1,99 for 1,0,0,0,1,0,0,0,1,0,0,1,99' do
      expect(NewIntcode.new.execute(nil,[1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 99])[0]).to eq([4, 8, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 99])
    end
  end
  context "for opcode with 3 and 4 instructions" do
    it "returns 1 for [3,0,4,0,99] and 1" do
      expect(NewIntcode.new.execute(1,[3,0,4,0,99])).to eq([[1,0,4,0,99],[1]])
    end
    it "returns 5 for [3,0,4,0,99] and 5" do
      expect(NewIntcode.new.execute(5,[3,0,4,0,99])).to eq([[5,0,4,0,99],[5]])
    end
    it "returns 3 for [3,1,4,0,99] and 2" do
      expect(NewIntcode.new.execute(2,[3,1,4,0,99])).to eq([[3,2,4,0,99],[3]])
    end
    it "returns 1 for [3,0,1,2,2,1,4,0,99] and 1" do
      expect(NewIntcode.new.execute(1,[3,0,1,2,2,1,4,0,99])).to eq([[1,2,1,2,2,1,4,0,99],[1]])
    end
    it "returns 1 for [3,0,2,2,2,1,4,0,99] and 1" do
      expect(NewIntcode.new.execute(1,[3,0,2,2,2,1,4,0,99])).to eq([[1,4,2,2,2,1,4,0,99],[1]])
    end
    it "returns 4 for [3,0,4,2,99] and 5" do
      expect(NewIntcode.new.execute(5,[3,0,4,2,99])).to eq([[5,0,4,2,99],[4]])
    end
    it "returns 4,4 for [3,0,4,2,4,2,99] and 5" do
      expect(NewIntcode.new.execute(5,[3,0,4,2,4,2,99])).to eq([[5,0,4,2,4,2,99],[4,4]])
    end
    it "returns 4,4 for [3,0,4,2,4,2,1,0,1,1,99] and 5" do
      expect(NewIntcode.new.execute(5,[3,0,4,2,4,2,1,0,1,1,99])).to eq([[5,5,4,2,4,2,1,0,1,1,99],[4,4]])
    end
  end
  context "for opcode instructions longer than a digit" do
    it "returns [2,1,1,0,99] for [01,1,1,0,99]" do
      expect(NewIntcode.new.execute(1,[01,1,1,0,99])[0]).to eq([2,1,1,0,99])
    end
    it "returns [2,1,1,0,99] for [101,1,1,0,99]" do
      expect(NewIntcode.new.execute(1,[101,1,1,0,99])[0]).to eq([2,1,1,0,99])
    end
    it "returns [4,2,1,0,99] for [102,2,1,0,99]" do
      expect(NewIntcode.new.execute(1,[102,2,1,0,99])[0]).to eq([4,2,1,0,99])
    end
    it "returns [2,1,1,0,99] for [1101,1,1,0,99]" do
      expect(NewIntcode.new.execute(1,[1101,1,1,0,99])[0]).to eq([2,1,1,0,99])
    end
    it "returns [2,2,1,0,99] for [1102,2,1,0,99]" do
      expect(NewIntcode.new.execute(1,[1102,2,1,0,99])[0]).to eq([2,2,1,0,99])
    end
    it "returns [4,1,1,0,99] for [1001,2,2,0,99]" do
      expect(NewIntcode.new.execute(1,[1001,2,2,0,99])[0]).to eq([4,2,2,0,99])
    end
    it "returns [1001,2,1,1,99] for [1001,3,1,1,99]" do
      expect(NewIntcode.new.execute(1,[1001,3,1,1,99])[0]).to eq([1001,2,1,1,99])
    end
    it "returns [1001,0,-1,1,99] for [1001,3,-1,1,99]" do
      expect(NewIntcode.new.execute(1,[1001,3,-1,1,99])[0]).to eq([1001,0,-1,1,99])
    end
  end
  context "for 5 and 6 instruction opcodes" do
    it "returns [3,1,5,1,13,1,1,1,12,4,12,99,1,9],[1] for 1,[3,1,5,1,13,1,1,1,12,4,12,99,1,9]" do
      expect(NewIntcode.new.execute(1,[3,1,5,1,13,1,1,1,12,4,12,99,1,9])).to eq([[3,1,5,1,13,1,1,1,12,4,12,99,1,9],[1]])
    end
    it "returns [3,0,5,1,13,1,1,1,12,4,12,99,0,9],[0] for 0,[3,1,5,1,13,1,1,1,12,4,12,99,0,9]" do
      expect(NewIntcode.new.execute(0,[3,1,5,1,13,1,1,1,12,4,12,99,0,9])).to eq([[3,0,5,1,13,1,1,1,12,4,12,99,0,9],[0]])
    end
    it "returns [3,1,6,1,13,1,1,1,12,4,12,99,2,9],[2] for 1,[3,1,6,1,13,1,1,1,12,4,12,99,0,9]" do
      expect(NewIntcode.new.execute(1,[3,1,6,1,13,1,1,1,12,4,12,99,0,9])).to eq([[3,1,6,1,13,1,1,1,12,4,12,99,2,9],[2]])
    end
    it "returns [3,0,6,1,13,1,1,1,12,4,12,99,0,9],[0] for 0,[3,1,6,1,13,1,1,1,12,4,12,99,0,9]" do
      expect(NewIntcode.new.execute(0,[3,1,6,1,13,1,1,1,12,4,12,99,0,9])).to eq([[3,0,6,1,13,1,1,1,12,4,12,99,0,9],[0]])
    end
  end
  context "for 7 and 8 instruction opcodes" do
    it "returns [7,1,2,5,99,1] for [7,1,2,5,99,0]" do
      expect(NewIntcode.new.execute(0,[7,1,2,5,99,0])[0]).to eq([7,1,2,5,99,1])
    end
    it "returns [7,1,1,5,99,0] for [7,1,1,5,99,9]" do
      expect(NewIntcode.new.execute(0,[7,1,1,5,99,9])[0]).to eq([7,1,1,5,99,0])
    end
    it "returns [8,1,1,5,99,1] for [8,1,1,5,99,0]" do
      expect(NewIntcode.new.execute(0,[8,1,1,5,99,0])[0]).to eq([8,1,1,5,99,1])
    end
    it "returns [8,1,2,5,99,0] for [8,1,2,5,99,9]" do
      expect(NewIntcode.new.execute(0,[8,1,2,5,99,9])[0]).to eq([8,1,2,5,99,0])
    end
  end
end
