require_relative "input_converter"
require_relative "shuttle_finder"
require_relative "consecutive_buses"

input = File.read("input.txt")

arrival_time = InputConverter.new.execute(input)[0]
bus_schedule = InputConverter.new.execute(input)[1]
buses = bus_schedule.select { |e| e != 0  }

bus_id = ShuttleFinder.new(arrival_time,buses).earliest_bus[0]
bus_time = ShuttleFinder.new(arrival_time,buses).earliest_bus[1]

answer = bus_id * (bus_time - arrival_time)

second_answer = ConsecutiveBuses.new(bus_schedule).consecutive_start

puts answer

puts second_answer
