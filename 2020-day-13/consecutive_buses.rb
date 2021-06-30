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

      @schedule[i] * multipliers[i] - @schedule[0] * multipliers[0] == i ?
      i -= 1  : @schedule[i] * multipliers[i] > @schedule[0] * multipliers[0] ?
      multipliers[0] += 1 : multipliers[i] += 1

    end

    @schedule[0] * multipliers[0]

  end

end
