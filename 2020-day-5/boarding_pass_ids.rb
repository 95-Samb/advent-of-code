require_relative "boarding_pass"

class BoardingPassIds
  def execute(passes)
    pass = BoardingPass.new(passes[0])
    [pass.row_identify * 8 + pass.column_identify]
  end
end
