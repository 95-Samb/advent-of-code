class BoardingPass
  def initialize(pass)
    @row_id = pass[0..6]
    @column_id = pass[7..-1]
  end

  def row_identify
    row_max = 127
    row_min = 0
    i = 0
    until i == 6
      if @row_id[i] == "F"
        row_max /= 2
      else row_min  += (row_max - row_min) / 2 + 1
      end
      i += 1
    end
    row_min
  end
end
