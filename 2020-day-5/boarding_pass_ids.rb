require_relative "boarding_pass"

class BoardingPassIds

  def execute(passes)
    pass_ids = passes.map { |e|
      BoardingPass.new(e).id
      }
  end

  def gap(ids)
    sorted_ids = ids.sort
    i = 0
    until i == sorted_ids.length
      return sorted_ids[i] + 1 if sorted_ids[i + 1] - sorted_ids[i] != 1
      i += 1
    end
  end

end
