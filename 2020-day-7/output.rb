require_relative "input_converter"
require_relative "bag"
require_relative "bag_processing"

input = File.read("input.txt")

bag_descriptions = InputConverter.new.execute(input)

bags = bag_descriptions.map do |e|
    bag = Bag.new(e)
    {name:bag.name, contents:bag.contents}
  end

answer = BagProcessing.new(bags).totally_contains("shiny gold bag")

puts answer.length
