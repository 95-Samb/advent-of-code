require_relative "../boot_code_formatter"

describe BootCodeFormatter do

  subject = "acc +1
             jmp +3
             nop +12"

  it "returns [{acc:1}] for acc +1     " do
    expect(BootCodeFormatter.new.execute("acc +1     ")).
    to eq([{acc:1}])
  end

  it "returns [{acc:1},{jmp:3},{nop:12}] for #{subject} " do
    expect(BootCodeFormatter.new.execute(subject)).
    to eq([{acc:1},{jmp:3},{nop:12}])
  end
end
