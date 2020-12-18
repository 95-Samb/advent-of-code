class ReportRepair

  def execute(input,numbers_amount)

    return nil if input.kind_of?(Array) == false || input.length < 2

    correct_set = find_correct_set(input,numbers_amount)

    correct_set.inject(:*)
  end

  def find_correct_set(input,numbers_amount)
    sets = input.combination(numbers_amount).to_a

    correct_set = sets.keep_if {|set| set.sum == 2020}.flatten.sort
  end

end
