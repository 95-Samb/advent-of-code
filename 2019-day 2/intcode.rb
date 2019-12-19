class Intcode
  def execute(input)
    if input[0] == 1
      input[input[3]] = input[input[1]] + input[input[2]]
    else
      input[input[3]] = input[input[1]] * input[input[2]]
    end
    input
  end
end
