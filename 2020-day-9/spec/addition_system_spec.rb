require_relative "../addition_system"

describe AdditionSystem do

  it "returns nil for empty imput" do
    expect(AdditionSystem.new([]).no_sum(2)).
    to eq([])
  end

  it "returns nil for empty imput" do
    expect(AdditionSystem.new([1,2,4]).no_sum(2)).
    to eq([4])
  end

end
