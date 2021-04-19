require_relative "../adapter_configurator"

describe AdapterConfigurator do

  context "#jolt_differences" do

    it "returns nil for no adapters" do
      expect(AdapterConfigurator.new([]).jolt_differences).to eq nil
    end
  end

end
