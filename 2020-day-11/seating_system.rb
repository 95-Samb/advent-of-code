class SeatingSystem

  def initialize(seats)
    @seats = seats
  end

  def identify_adjacents(coords)

    #needs refactoring

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

  def apply_rules
    @seats.map.with_index { |row , row_index| row.map.with_index { |e,i|
        if e == "L" && !identify_adjacents([row_index,i]).any?("#")
          "#"
        elsif identify_adjacents([row_index,i]).count("#") >= 4 && e == "#"
          "L"
        else e
        end
      }
    }
  end

  def solve_seating

    loop do

      break if @seats == apply_rules

      @seats = apply_rules

    end

    @seats

  end

  def find_visibles(coords)
    visibiles = []

    i = 1
    loop do
      if coords[1] + i >= @seats[0].length
        break
      end
      if @seats[coords[0]][coords[1] + i] != "."
        visibiles.push(@seats[coords[0]][coords[1] + i])
        break
      end
      i += 1
    end

    j = 1
    loop do
      if coords[1] - j < 0
        break
      end
      if @seats[coords[0]][coords[1] - j] != "."
        visibiles.push(@seats[coords[0]][coords[1] - j])
        break
      end
      j += 1
    end

    i = 1
    loop do
      if coords[0] + i >= @seats.length
        break
      end
      if @seats[coords[0] + i][coords[1]] != "."
        visibiles.push(@seats[coords[0] + i][coords[1]])
        break
      end
      i += 1
    end

    j = 1
    loop do
      if coords[0] - j < 0
        break
      end
      if @seats[coords[0] - j][coords[1]] != "."
        visibiles.push(@seats[coords[0] - j][coords[1]])
        break
      end
      j += 1
    end

    i = 1
    j = 1
    loop do
      if coords[0] + i >= @seats.length || coords[1] + j >= @seats[0].length
        break
      end
      if @seats[coords[0] + i][coords[1] + j] != "."
        visibiles.push(@seats[coords[0] + i][coords[1] + j])
        break
      end
      i += 1
      j += 1
    end

    i = 1
    j = 1
    loop do
      if coords[0] - i < 0 || coords[1] - j < 0
        break
      end
      if @seats[coords[0] - i][coords[1] - j] != "."
        visibiles.push(@seats[coords[0] - i][coords[1] - j])
        break
      end
      i += 1
      j += 1
    end

    i = 1
    j = 1
    loop do
      if coords[0] + i >= @seats.length || coords[1] - j < 0
        break
      end
      if @seats[coords[0] + i][coords[1] - j] != "."
        visibiles.push(@seats[coords[0] + i][coords[1] - j])
        break
      end
      i += 1
      j += 1
    end

    i = 1
    j = 1
    loop do
      if coords[0] - i < 0 || coords[1] + j >= @seats[0].length
        break
      end
      if @seats[coords[0] - i][coords[1] + j] != "."
        visibiles.push(@seats[coords[0] - i][coords[1] + j])
        break
      end
      i += 1
      j += 1
    end

    visibiles
  end

  def apply_new_rules
    @seats.map.with_index { |row , row_index| row.map.with_index { |e,i|
        if e == "L" && !find_visibles([row_index,i]).any?("#")
          "#"
        elsif find_visibles([row_index,i]).count("#") >= 5 && e == "#"
          "L"
        else e
        end
      }
    }
  end

  def new_solve_seating

    loop do

      break if @seats == apply_new_rules

      @seats = apply_new_rules

    end

    @seats

  end




end
