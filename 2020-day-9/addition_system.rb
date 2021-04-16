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
    i = 1
    j = 0

    until j == @numbers.length - 1
      return @numbers[j..i] if @numbers[j..i].sum == number
      i += 1
      if i == @numbers.length
        j += 1
        i = j + 1
      end
    end
    nil
  end

end
