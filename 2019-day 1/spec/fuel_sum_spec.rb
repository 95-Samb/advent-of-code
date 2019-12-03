require_relative "../fuel_sum"

describe "FuelSum" do
  it "returns 0 for 0" do
    expect(FuelSum.new.execute("0")).to eq(0)
  end
  it "returns 0 for 6" do
    expect(FuelSum.new.execute("6")).to eq(0)
  end
  it "returns 1 for 9" do
    expect(FuelSum.new.execute("9")).to eq(1)
  end
end
