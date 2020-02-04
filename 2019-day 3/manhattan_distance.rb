class ManhattanDistance
  def execute(input)
  end
  def route(starting_point,input)
    starting_point.map!(&:to_i)
    route_points = []

    if horizontal?(input)
      vector = translate_instruction(input)
      vector_direction = vector <=> 0
      vector.abs.times do
        starting_point[0] += vector_direction
        route_points.push(starting_point.dup)
      end
    else
      vector = translate_instruction(input)
      vector_direction = vector <=> 0
      vector.abs.times do
        starting_point[1] += vector_direction
        route_points.push(starting_point.dup)
      end
    end

    route_points
  end

  def horizontal?(input)
    input.include?("R") || input.include?("L")
  end

  def translate_instruction(input)
    input.gsub(/[RLUD]/ ,"U" => "","D" => "-",
      "R" => "","L" => "-").to_i
  end

end

