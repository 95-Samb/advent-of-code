require_relative "../looped_amplifier_signal"

describe LoopedAmplifierSignal do
  it "returns 139629729 for set intcode,phase setting 9,8,7,6,5 and
  intial input 0 " do
  intcode = [3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,
            27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5]
  expect(LoopedAmplifierSignal.new(intcode,[9,8,7,6,5],0).execute).to eq(139629729)
end

end
