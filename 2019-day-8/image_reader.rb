class ImageReader
  def execute
  end
  def initialize(width,height)
    @pixel_width = width
    @pixel_height = height
  end
  def layers(input)
    [[input.to_i]]
  end
end
