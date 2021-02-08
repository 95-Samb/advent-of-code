class BoardingPass
  def initialize(pass)
    @row_id = pass[0..6]
    @column_id = pass[7..-1]
  end

  def row_identify
    0
  end
end
