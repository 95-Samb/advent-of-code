class SeatingSystem

  def initialize(seats)
    @seats = seats
  end

  def identify_adjacents(coords)

    if coords == [0,0]
      [@seats[0][1]]
    elsif  coords == [0,1]
      [@seats[0][0]]
    end

  end

end
