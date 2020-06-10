
class Orbits
  def execute(input)
    centre_point = all_orbiters(input)[1]
    orbits = orbit_logic(centre_point,input)
    i = 1
    total_orbits = 0
    until i == orbits.length
      total_orbit_length = orbits[i].length * i
      total_orbits += total_orbit_length
      i += 1
    end
    total_orbits
  end
  def orbit_logic(centre_point,input)
    output = [centre_point]
    output += [orbiting_of_point(centre_point,input)]
    i = 0
    until i == output[-1].length || output[-1].empty?
      new_orbits = []
      new_orbit_centres = output[-1][i].dup
      unless orbiting_of_point(new_orbit_centres,input).empty?
        new_orbits += orbiting_of_point(new_orbit_centres,input)
      end
      i += 1
      if i == output[-1].length
        output.push(new_orbits)
        i = 0
      end
    end
    output[0..-2]
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
