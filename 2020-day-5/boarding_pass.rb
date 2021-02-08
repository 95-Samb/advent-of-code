class BoardingPass
  def initialize(pass)
    @row_id = pass[0..6]
    @column_id = pass[7..-1]
  end

  def row_identify
    if @row_id[0] == "F"
      0
    else
      if @row_id[1] == "F"
        64
      else
        if @row_id[2] == "F"
          96
        else 112
        end
      end
    end
  end
end
