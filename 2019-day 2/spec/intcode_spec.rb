require_relative "../intcode.rb"

describe Intcode do
  it "returns 2,0,0,0,99 for 1,0,0,0,99" do
    expect(Intcode.new.execute([1,0,0,0,99])).to eq([2,0,0,0,99])
  end
  it "returns 2,1,0,0,99 for 1,1,0,0,99" do
    expect(Intcode.new.execute([1,1,0,0,99])).to eq([2,1,0,0,99])
  end
  it "returns 1,2,0,1,99 for 1,1,0,1,99" do
    expect(Intcode.new.execute([1,1,0,1,99])).to eq([1,2,0,1,99])
  end
  it "returns 2,1,0,0,99 for 2,1,0,0,99" do
    expect(Intcode.new.execute([2,1,0,0,99])).to eq([2,1,0,0,99])
  end
  it "returns 1,2,1,2,99 for 1,2,0,2,99" do
    expect(Intcode.new.execute([1,2,0,2,99])).to eq([1,2,1,2,99])
  end
  it "returns 2,2,6,2,99 for 2,2,3,2,99" do
    expect(Intcode.new.execute([2,2,3,2,99])).to eq([2,2,6,2,99])
  end
  it "returns 1,0,1,2,99,0 for 1,0,5,2,99,0" do
    expect(Intcode.new.execute([1,0,5,2,99,0])).to eq([1,0,1,2,99,0])
  end

end
