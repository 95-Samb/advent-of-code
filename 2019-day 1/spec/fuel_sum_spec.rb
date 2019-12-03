require_relative "../fuel_sum"

describe "FuelSum" do
  it "returns 0 for 0" do
    expect(FuelSum.new.mass_calculator("0")).to eq(0)
  end
  it "returns 0 for 6" do
    expect(FuelSum.new.mass_calculator("6")).to eq(0)
  end
  it "returns 1 for 9" do
    expect(FuelSum.new.mass_calculator("9")).to eq(1)
  end
  it "returns 1 for 10" do
    expect(FuelSum.new.mass_calculator("10")).to eq(1)
  end
  it "returns 1 for 11" do
    expect(FuelSum.new.mass_calculator("11")).to eq(1)
  end
  it "returns 2 for [9,11]" do
    expect(FuelSum.new.execute(["9","11"])).to eq(2)
  end
  it "returns 4 for [12,13]" do
    expect(FuelSum.new.execute(["12","13"])).to eq(4)
  end


end
