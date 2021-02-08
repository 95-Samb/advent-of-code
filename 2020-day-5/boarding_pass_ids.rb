require_relative "boarding_pass"

class BoardingPassIds
  def execute(passes)
    pass_ids = passes.map { |e|
      pass = BoardingPass.new(e)
      pass.row_identify * 8 + pass.column_identify
      }
  end
end
