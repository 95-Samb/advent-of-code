
class Orbits
  def execute(input)
    centre_point = centre_point(input)
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
    new_orbits = []
    until output[-1].empty?
      new_orbit_centre = output[-1][i]
      new_orbits += orbiting_of_point(new_orbit_centre,input)
      i += 1
      if i == output[-1].length
        output.push(new_orbits)
        i = 0
        new_orbits = []
      end
    end
    output[0..-2]
  end
  def centre_point(input)
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
    centre_point
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
  def point_of_orbit(point,input)
    orbits = input.map { |e| e.split(")")  }
    orbiting = orbits.select { |e| e[1] == point  }
    orbiting.flatten[0]
  end
  def single_orbit_logic(point,input)
    orbit_path = []
    orbitting_point = point
    until orbitting_point == nil
      new_orbit = point_of_orbit(orbitting_point,input)
      orbit_path.push(new_orbit)
      orbitting_point = new_orbit
    end
    orbit_path[0..-2]
  end
  def orbit_transfers(first_point,second_point,input)
    first_point_orbit_path = single_orbit_logic(first_point,input)
    second_point_orbit_path = single_orbit_logic(second_point,input)
    intersects = first_point_orbit_path & second_point_orbit_path
    orbit_transfers = first_point_orbit_path.index(intersects[0]) +
    second_point_orbit_path.index(intersects[0])
  end
end
