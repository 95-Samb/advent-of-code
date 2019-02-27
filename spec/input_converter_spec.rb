require_relative '../input_converter.rb'

describe InputConverter do
  it "returns[0] for 0" do
    expect(subject.convert("0")).to eq([0])
  end

  it "returns[1] for 1" do
    expect(subject.convert("1")).to eq([1])
  end

  it "returns[1,0] for 1 and 0, separated by a new line" do
    expect(subject.convert("1\n0")).to eq([1,0])
  end

  it "returns[0,1] for 0 and 1, separated by a new line" do
    expect(subject.convert("0\n1")).to eq([0,1])
  end

  it "returns[1,4] for 1 and 4, separated by a new line" do
    expect(subject.convert("1\n4")).to eq([1,4])
  end

  it "returns[-1, 1] for -1 and 1, separated by a new line" do
    expect(subject.convert("-1\n1")).to eq([-1,1])
  end

  it "returns[11,11] for 11 and 11, separated by a new line" do
    expect(subject.convert("11\n11")).to eq([11,11])
  end

  it "returns[0,1] * 10 for 0 and 1 separated by a new
    line repeated 10 times" do
    expect(subject.convert(("1\n4" + "\n") * 10)).to eq([1,4] * 10)
  end

  it "returns [0, 1, 2] for 0, 1 and 2, all on new lines" do
    expect(subject.convert("0\n1\n2")).to eq([0,1,2])
  end
end
