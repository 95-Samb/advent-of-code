require_relative "input_converter"
require_relative "shuttle_finder"

input = File.read("input.txt")

arrival_time = InputConverter.new.execute(input)[0]
buses = InputConverter.new.execute(input)[1]

bus_id = ShuttleFinder.new(arrival_time,buses).earliest_bus[0]
bus_time = ShuttleFinder.new(arrival_time,buses).earliest_bus[1]

answer = bus_id * (bus_time - arrival_time)

puts answer
