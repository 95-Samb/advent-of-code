class ReportRepair

  def execute(input)

    return nil if input.kind_of?(Array) == false || input.length < 2


    if input[0..1].sum == 2020
      input[0..1].inject(&:*)
    elsif input[1..2].sum == 2020
      input[1..2].inject(&:*)
    end
  end

end
