class ReportRepair

  def execute(input)

    return nil if input.kind_of?(Array) == false || input.length < 2

    correct_pair = find_correct_pair(input)

    correct_pair.inject(:*)
  end

  def find_correct_pair(input)
    pairs = input.combination(2).to_a

    correct_pair = pairs.keep_if {|pair| pair.sum == 2020}.flatten.sort
  end

end
