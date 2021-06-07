require_relative "../input_converter"

describe InputConverter do

  it "returns 1 and 1 for 1 \n 1" do
    expect(InputConverter.new.execute("    1   \n     1    ")).to eq([1,[1]])
  end

  it "returns 1 and 1 for 1 \n 1,x,x,x" do
    expect(InputConverter.new.execute("    1   \n     1,x,x,x    ")).to eq([1,[1]])
  end

  it "returns 7 and 1,6 for 7 \n 1,x,6,x" do
    expect(InputConverter.new.execute("    7   \n     1,x,6,x    ")).to eq([7,[1,6]])
  end

end
