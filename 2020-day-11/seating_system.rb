class SeatingSystem

  def initialize(seats)
    @seats = seats
  end

  def identify_adjacents(coords)

    adjacents = []

    if coords[1] - 1 >= 0
      adjacents.push(@seats[coords[0]][coords[1] - 1])
    end
    if coords[1] + 1 < @seats[0].length
      adjacents.push(@seats[coords[0]][coords[1] + 1])
    end
    if coords[0] + 1 < @seats.length
      adjacents.push(@seats[coords[0] + 1][coords[1]])
    end
    if coords[0] - 1 >= 0
      adjacents.push(@seats[coords[0] - 1][coords[1]])
    end
    if coords[1] - 1 >= 0 && coords[0] + 1 < @seats.length
      adjacents.push(@seats[coords[0] + 1][coords[1] - 1])
    end
    if coords[1] - 1 >= 0 && coords[0] - 1 >= 0
      adjacents.push(@seats[coords[0] - 1][coords[1] - 1])
    end
    if coords[1] + 1 < @seats[0].length && coords[0] + 1 < @seats.length
      adjacents.push(@seats[coords[0] + 1][coords[1] + 1])
    end
    if coords[1] + 1 < @seats[0].length && coords[0] - 1 >= 0
      adjacents.push(@seats[coords[0] - 1][coords[1] + 1])
    end


    adjacents.flatten

  end

end