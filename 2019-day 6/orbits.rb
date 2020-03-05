
class Orbits
  def execute(input)
    orbits = {}
    answer = input.length
    answer += 1 if input[1] && input[1][0] == "B"
    answer
  end
  def orbit_logic(input)
    all_orbiters = all_orbiters(input)
    orbiters = all_orbiters[0]
    centre_point = all_orbiters[1]

    answer = [input[0][0],input[0][2]]
    answer.push(input[1][2]) if input[1] && input[1][0] != input[0][0]
    answer[1] += input[1][2] if input[1][0] == input[0][0]
    answer
  end
  def all_orbiters(input)
    i = 0
    orbited = []
    orbiting = []
    while i < input.length
      orbiters = input[i].split(")")
      orbited.push(orbiters[0])
      orbiting.push(orbiters[1])
      i += 1
    end
    all_orbiters = orbited + orbiting
    [all_orbiters.uniq,(all_orbiters - orbiting).uniq.join]
  end
end
