class BoardingPass

  def initialize(pass)
    @row_id = pass[0..6]
    @column_id = pass[7..-1]
  end

  def id
    row_identify * 8 + column_identify
  end

  private

  def row_identify
    row_max = 127
    row_min = 0
    i = 0
    until i == 7
      if @row_id[i] == "F"
        row_max -= (row_max - row_min) / 2 + 1
      else row_min  += (row_max - row_min) / 2 + 1
      end
      i += 1
    end
    row_min
  end

  def column_identify
    column_max = 7
    column_min = 0
    i = 0
    until i == 3
      if @column_id[i] == "L"
        column_max -= (column_max - column_min) / 2 + 1
      else column_min  += (column_max - column_min) / 2 + 1
      end
      i += 1
    end
    column_min
  end



end
