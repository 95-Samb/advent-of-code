class ManhattanDistance
  def execute(input)
  end
  def route(starting_point,input)
    starting_point.map!(&:to_i)
    if input.include?("R") || input.include?("L")
      vector = input.gsub(/[RL]/ ,"R" => "","L" => "-").to_i
      starting_point[0] += vector
    else
      vector = input.gsub(/[UD]/ ,"U" => "","D" => "-").to_i
      starting_point[1] += vector
    end
    starting_point
  end
end

