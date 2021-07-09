class ConsecutiveBuses

  def initialize(schedule)
    @schedule = schedule
    @schedule.map! {|e| e == 0 ? 1 : e}
    @multipliers = [1] * @schedule.length
  end

  def consecutive_start

    return nil if @schedule[1] % @schedule[0] == 0 && @schedule[0] != 1

    i = @schedule.length - 1

    until i == 0

      multiple_difference(i)

      @multipliers.map!.with_index {
        |multiplier,index|

        @minimum_multiplier = ((@schedule[0] * @multipliers[0])/ @schedule[index].to_f ).ceil

        multiplier < @minimum_multiplier ? @minimum_multiplier : multiplier
      }

      @schedule[i + 1] && @schedule[i + 1] * @multipliers[i + 1] -
      @schedule[0] * @multipliers[0] != i + 1 ?

      i += 1 : i -= 1

    end

    @schedule[0] * @multipliers[0]

  end

  def multiple_difference(diff)
    until @schedule[diff] * @multipliers[diff] - @schedule[0] * @multipliers[0] == diff
      @schedule[diff] * @multipliers[diff] > @schedule[0] * @multipliers[0] + diff ?
      @multipliers[0] += 1 : @multipliers[diff] += 1
    end
  end

end
