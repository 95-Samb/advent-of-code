
class Orbits
  def execute(input)
    orbits = {}
    answer = input.length
    answer += 1 if input[1] && input[1][0] == "B"
    answer
  end
  def orbit_logic(input)
    answer = [input[0][0],input[0][2]]
    answer.push(input[1][2]) if input[1] && input[1][0] != input[0][0]
    answer[1] += input[1][2] if input[1][0] == input[0][0]
    answer
  end
  def all_orbiters(input)
    i = 0
    answer = []
    while i < input.length
      answer.push(input[i][0]).push(input[i][2])
      i += 1
    end
    answer.uniq
  end
end
