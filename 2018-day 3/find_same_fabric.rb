
#from left,from top, from_left X from_top


class FindSameFabric
  def execute(input)
    unless input.is_a?(Array) && input.length > 1
      nil
    else
      refined_input = input.map { |e| e = e.split(" ")  }
      starting_coords = refined_input.map { |x|  x = x[2][0..-2].split(",")}
      area_size = refined_input.map { |x|  x = x[3][0..-1].split("x")}
      starting_coords.map!{ |e| e = e.map!(&:to_i)}
      area_size.map!{ |e| e = e.map!(&:to_i)}
    end
  end
end
