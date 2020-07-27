#output
require_relative "amplifier_signal"
require_relative "../2019-day 5/input_converter"
require_relative "../2019-day 5/new_intcode"

input = File.read("input.txt")
acs = InputConverter.new.convert(input) #Amplifier controller software

answer = AmplifierSignal.new.execute([1,2,3,4,0],0,acs)


puts answer

