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
  it "returns 22 for [36,37]" do
    expect(SumFuelSum.new.execute(["36","37"])).to eq(22)
  end
  it "returns 33 for [36,60]" do
    expect(SumFuelSum.new.execute(["36","60"])).to eq(33)
  end
  context "for fuel for fuel method" do
    it "returns 10 for 33" do
      expect(SumFuelSum.new.fuel_for_fuel("33")).to eq(10)
    end
    it "returns 26 for 70" do
      expect(SumFuelSum.new.fuel_for_fuel("70")).to eq(26)
    end
    it "returns 45 for 111" do
      expect(SumFuelSum.new.fuel_for_fuel("111")).to eq(45)
    end
  end

end
