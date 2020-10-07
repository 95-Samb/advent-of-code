class ImageReader
  def execute
  end
  def initialize(width,height)
    @pixel_width = width
    @pixel_height = height
  end
  def layers(input)
    layer_size = @pixel_width * @pixel_height
    output = input.scan(/.{#{layer_size}}/).map{ |layer| layer.scan(/.{#{@pixel_width}}/)}
  end
  def fewest_digit(digit,layers)
    digit_counts = layers.map { |layer| layer.join.count(digit)  }
    layer_with_fewest_digit = digit_counts.min
    required_index = digit_counts.index(layer_with_fewest_digit)
    layers[required_index]
  end
  def layer_digit_count_multiplier(first_input,second_input,layer)
    layer.join.count(first_input) * layer.join.count(second_input)
  end
end
