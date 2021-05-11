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

    adjacents.flatten

  end

end
