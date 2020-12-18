class ReportRepair

  def execute(input,numbers_amount)

    return nil if input.kind_of?(Array) == false || input.length < 2

    correct_pair = find_correct_pair(input,numbers_amount)

    correct_pair.inject(:*)
  end

  def find_correct_pair(input,numbers_amount)
    pairs = input.combination(numbers_amount).to_a

    correct_pair = pairs.keep_if {|pair| pair.sum == 2020}.flatten.sort
  end

end
