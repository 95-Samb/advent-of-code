require_relative "../boot_code_computer"

describe BootCodeComputer do
  context "given simple boot code" do

    bootcode = [{acc:1},{jmp:1}]
    other_bootcode = [{acc:2},{jmp:1}]

    it "processes #{bootcode}" do
      expect(BootCodeComputer.new(bootcode).execute).to eq 1
    end

    it "processes #{other_bootcode}" do
      expect(BootCodeComputer.new(other_bootcode).execute).to eq 2
    end

  end

  context "given complicated boot code" do

    bootcode = [{acc:1},{jmp:2},{acc:10}]
    other_bootcode = [{acc:1},{jmp:4},{acc:10},{nop:3},{acc:2}]

    it "processes #{bootcode}" do
      expect(BootCodeComputer.new(bootcode).execute).to eq 1
    end

    it "processes #{other_bootcode}" do
      expect(BootCodeComputer.new(other_bootcode).execute).to eq 1
    end

  end
end
