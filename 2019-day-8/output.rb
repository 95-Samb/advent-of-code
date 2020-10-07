# frozen_string_literal: true

# output
require_relative 'image_reader'
require_relative "image_renderer"

input = File.read('input.txt')

layers = ImageReader.new(25,6).layers(input)

layer_with_least_zeroes = ImageReader.new(25,6).fewest_digit("0",layers)

one_times_two_count = ImageReader.new(25,6).layer_digit_count_multiplier("1","2",layer_with_least_zeroes)

message = ImageRenderer.new.decode(layers)

puts one_times_two_count

puts message
