#output
require_relative "amplifier_signal"
require_relative "../2019-day 5/input_converter"

input = File.read("input.txt")
acs = InputConverter.new.convert(input) #Amplifier controller software

answer = AmplifierSignal.new.execute(0,[1,2,3,4,0],acs)

puts answer

