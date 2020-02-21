class ManhattanDistance
  def execute(input)
    intersections = all_points(input)[0] & all_points(input)[1]
    if intersections.empty?
      nil
    else intersections
    end
    distances = distance_manhattan(intersections)
    distances.sort[0]
  end

  def second_execute(input)
    intersection = quickest_intersection(input)
    all_points(input)[0].index(intersection) + all_points(input)[1].index(intersection) + 2
  end

  def quickest_intersection(input)
    intersections = all_points(input)[0] & all_points(input)[1]
    if intersections.empty?
      nil
    else intersections
    end
    intersections.sort_by{|intersection| intersection_steps(intersection,input)}[0]
  end

  def intersection_steps(intersection,input)
    [all_points(input)[0].index(intersection) + 1,all_points(input)[1].index(intersection) + 1].sum
  end

  def distance_manhattan(input)
    output = input.dup
    output.map! { |e| e.map(&:abs).sum  }
  end

  def route(starting_point,input)
    current_point = starting_point.dup.map(&:to_i)
    route_points = []

    if horizontal?(input)
      vector = translate_instruction(input)
      vector_direction = vector <=> 0
      vector.abs.times do
        current_point[0] += vector_direction
        route_points.push(current_point.dup)
      end
    else
      vector = translate_instruction(input)
      vector_direction = vector <=> 0
      vector.abs.times do
        current_point[1] += vector_direction
        route_points.push(current_point.dup)
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

  def all_points(input)
    first_wire_points = [[0,0]]
    second_wire_points = [[0,0]]
    i = 0
    first_wire_instructions = input[0].split(",")
    until i ==  first_wire_instructions.length
      wire_coords = (route(first_wire_points.dup[-1],first_wire_instructions[i]))
      first_wire_points += wire_coords
      i += 1
    end
    first_wire_points.shift
    j = 0
    second_wire_instructions = input[1].split(",")
    until j ==  second_wire_instructions.length
      wire_coords = (route(second_wire_points.dup[-1],second_wire_instructions[j]))
      second_wire_points += wire_coords
      j += 1
    end
    second_wire_points.shift
    [first_wire_points,second_wire_points]
  end


end

