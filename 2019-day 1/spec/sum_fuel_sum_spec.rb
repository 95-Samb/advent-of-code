require_relative "../sum_fuel_sum"

describe "SumFuelSum" do
  it "returns 10 for 33" do
    expect(SumFuelSum.new.execute(["33"])).to eq(10)
  end
  it "returns 10 for 34" do
    expect(SumFuelSum.new.execute(["34"])).to eq(10)
  end
  it "returns 11 for 36" do
    expect(SumFuelSum.new.execute(["36"])).to eq(11)
  end
end
