require_relative "../adapter_configurator"

describe AdapterConfigurator do

  context "#jolt_differences" do

    it "returns nil for no adapters" do
      expect(AdapterConfigurator.new([]).jolt_differences).to eq nil
    end

    it "returns one difference of 1 for [1]" do
      expect(AdapterConfigurator.new([1]).jolt_differences).to eq ({one: 1})
    end

    it "returns one difference of 1 and one of 3 for [1,4]" do
      expect(AdapterConfigurator.new([1,4]).jolt_differences).to eq ({one: 1,three: 1})
    end

    it "returns no relevant number of differences for [2,4]" do
      expect(AdapterConfigurator.new([2,4]).jolt_differences).to eq ({one: 0,three: 0})
    end

  end

end
