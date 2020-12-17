class ReportRepair

  def execute(input)
    if input.sum == 2020
      input.inject(&:*)
    else
      nil
    end
  end

end
