class TobogganTrajectory
  def execute(input)
    i = 1
    output = 0
    while i < input.length
      if input[i][i * 3] == "#"
        output += 1
      end
      i += 1
    end
    output
  end
end
