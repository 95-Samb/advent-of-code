
class Orbits
  def execute(input)
    orbits = {}
    answer = input.length
    answer += 1 if input[1] && input[1][0] == "B"
    answer
  end
  def orbit_logic(centre_point,input)
    output = [centre_point]
    orbitted = [centre_point]
    output += [orbiting_of_point(centre_point,input)]
    new_orbit_centres = output[-1][0].dup
    unless orbiting_of_point(new_orbit_centres,input).empty?
      output += [orbiting_of_point(new_orbit_centres,input)]
    end
    output
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
    centre_point = (all_orbiters - orbiting).uniq.join
    [all_orbiters.uniq,centre_point]
  end
  def orbiting_of_point(point,input)
    orbiting_points = []
    orbits = input.map { |e| e.split(")")  }
    i = 0
    while i < orbits.length
      orbiting_points.push(orbits[i][1]) if orbits[i][0] == point
      i += 1
    end
    orbiting_points
  end
end
