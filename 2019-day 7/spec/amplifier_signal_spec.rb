require_relative "../amplifier_signal"
require_relative "../../2019-day 5/input_converter"

describe AmplifierSignal do
  input = File.read("input.txt")
  acs = InputConverter.new.convert(input)
  it "returns an output for the first amplifier" do
    expect(NewIntcode.new.execute([0,1],acs)[1].first).to be_a(Integer)
  end
  it "returns 43210 for phase setting sequence 4,3,2,1,0
      and 3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0" do
      expect(AmplifierSignal.new.phase_setting_output([4,3,2,1,0],0,
        [3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0])).to eq(43210)
  end
  it "returns 54321 for phase setting sequence 0,1,2,3,4
      and 3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0" do
      expect(AmplifierSignal.new.phase_setting_output([0,1,2,3,4],0,
        [3,23,3,24,1002,24,10,24,1002,23,-1,23,
          101,5,23,23,1,24,23,23,4,23,99,0,0])).to eq(54321)
  end
  it "returns 65210 for phase setting sequence 1,0,4,3,2
      and 3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0" do
      expect(AmplifierSignal.new.phase_setting_output([1,0,4,3,2],0,
        [3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,
          1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0])).to eq(65210)
  end
end
