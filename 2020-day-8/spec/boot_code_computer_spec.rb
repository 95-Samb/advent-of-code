require_relative "../boot_code_computer"

describe BootCodeComputer do
  context "given simple boot code" do

    bootcode = [{acc:1},{jmp:1}]
    other_bootcode = [{acc:2},{jmp:1}]

    it "processes bootcode" do
      expect(BootCodeComputer.new(bootcode).execute).to eq 1
    end

    it "processes other bootcode" do
      expect(BootCodeComputer.new(other_bootcode).execute).to eq 2
    end

  end
end
