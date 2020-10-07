class ImageReader
  def execute
  end
  def initialize(width,height)
    @pixel_width = width
    @pixel_height = height
  end
  def layers(input)
    [input.scan(/.{#{@pixel_width}}/)]
  end
end
