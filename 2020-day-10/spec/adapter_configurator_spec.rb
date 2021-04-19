require_relative "../adapter_configurator"

describe AdapterConfigurator do

  context "#jolt_differences" do

    it "returns nil for no adapters" do
      expect(AdapterConfigurator.new([]).jolt_differences).to eq nil
    end

    it "returns one difference of 1 for [1]" do
      expect(AdapterConfigurator.new([1]).jolt_differences).to eq 1
    end

  end

end
