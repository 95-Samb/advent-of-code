class ConsecutiveBuses

  def initialize(schedule)
    @schedule = schedule
    @schedule.map! {|e| e == 0 ? 1 : e}
  end

  def consecutive_start

    return nil if @schedule[1] % @schedule[0] == 0 && @schedule[0] != 1

    multipliers = [1] * @schedule.length

    i = @schedule.length - 1

    until i == 0

      if @schedule[i] * multipliers[i] - @schedule[0] * multipliers[0] == i

        multipliers.map!.with_index {
          |multiplier,index|
          ((@schedule[0] * multipliers[0]) / @schedule[index].to_f).ceil
        }

        # puts multipliers

        @schedule[i + 1] && @schedule[i + 1] * multipliers[i + 1] -
        @schedule[0] * multipliers[0] != i + 1 ?

        i += 1 : i -= 1



      else

        @schedule[i] * multipliers[i] > @schedule[0] * multipliers[0] ?
        multipliers[0] += 1 : multipliers[i] += 1

      end

    end

    @schedule[0] * multipliers[0]

  end

end
