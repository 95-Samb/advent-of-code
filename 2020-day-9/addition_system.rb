class AdditionSystem

  def initialize(numbers)
    @numbers = numbers
  end

  def no_pair_sum(preamble)
    return [] if @numbers.empty?

    i = preamble
    no_possible_pairs = []

    until i == @numbers.length

      possible_sums = @numbers[(i-preamble)..i - 1].combination(2).to_a.map(&:sum)

      no_possible_pairs.push(@numbers[i]) unless possible_sums.any?(@numbers[i])

      i += 1

    end

    no_possible_pairs

  end

  def continuous_sum(number)
    return @numbers[0..1] if @numbers[0..1].sum == number
    return @numbers[1..2] if @numbers[1..2].sum == number
    return @numbers if @numbers.sum == number
    nil
  end

end
