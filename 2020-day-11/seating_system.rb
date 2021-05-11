class SeatingSystem

  def initialize(seats)
    @seats = seats
  end

  def identify_adjacents(coords)
    @seats[0][1] ? [@seats[0][1]] : []
  end

end
