require_relative "../boot_code_computer"

describe BootCodeComputer do
  context "given simple boot code" do

    bootcode = [{acc:1},{jmp:1}]
    other_bootcode = [{acc:2},{jmp:1}]

    it "processes #{bootcode}" do
      expect(BootCodeComputer.new(bootcode,"infinite loop").execute).to eq 1
    end

    it "processes #{other_bootcode}" do
      expect(BootCodeComputer.new(other_bootcode,"infinite loop").execute).to eq 2
    end

  end

  context "given complicated boot code" do

    bootcode = [{acc:1},{jmp:2},{acc:10}]
    other_bootcode = [{acc:1},{jmp:4},{acc:10},{nop:3},{acc:2}]
    another_bootcode = [{acc:1},{nop:3},{jmp:4},{acc:3},{jmp:2},{acc:99},{acc:2},{jmp:4}]

    it "processes #{bootcode}" do
      expect(BootCodeComputer.new(bootcode,"infinite loop").execute).to eq 1
    end

    it "processes #{other_bootcode}" do
      expect(BootCodeComputer.new(other_bootcode,"infinite loop").execute).to eq 1
    end

    it "processes #{another_bootcode}" do
      expect(BootCodeComputer.new(another_bootcode,"infinite loop").execute).to eq 6
    end

  end

  context "given simple bootcode with last instruction condition" do

    bootcode = [{acc:1},{jmp:-1},{nop:1}]

    it "processes #{bootcode}" do
      expect(BootCodeComputer.new(bootcode,"last instruction").execute).to eq nil
    end

  end

  context "for identify instructions method" do

    bootcode = [{acc:1},{jmp:-1},{jmp:1}]

    other_bootcode = [{acc:1},{jmp:-1},{jmp:1},{nop:10}]

    it "returns [1,2] for #{bootcode}" do
      expect(BootCodeComputer.new(bootcode,"last instruction")
      .identify_instructions(:jmp)).to eq [1,2]
    end

    it "returns [3] for #{other_bootcode}" do
      expect(BootCodeComputer.new(other_bootcode,"last instruction")
      .identify_instructions(:nop)).to eq [3]
    end
  end

  context "for infinite fix method" do

    bootcode = [{nop:1},{jmp:-1},{acc:1}]

    other_bootcode = [{nop:1},{nop:2},{jmp:2},{jmp:1}]

    it "returns nil,1 for  #{bootcode}" do
      expect(BootCodeComputer.new(bootcode,"last instruction").infinite_fix).
      to contain_exactly nil,1
    end

    it "returns nil,1 for  #{other_bootcode}" do
      expect(BootCodeComputer.new(other_bootcode,"last instruction").infinite_fix).
      to contain_exactly 0,nil,nil,0
    end
  end
end
