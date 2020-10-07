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
end
