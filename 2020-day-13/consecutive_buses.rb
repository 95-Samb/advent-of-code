class ConsecutiveBuses

  def initialize(schedule)
    @schedule = schedule
    @schedule.map! {|e| e == 0 ? 1 : e}
  end

  def consecutive_start

    return nil if @schedule[1] % @schedule[0] == 0 && @schedule[0] != 1

    multipliers = [1] * @schedule.length

    if @schedule[1]

      until @schedule[1] * multipliers[1] - @schedule[0] * multipliers[0] == 1

      @schedule[1] * multipliers[1] > @schedule[0] * multipliers[0] ?
      multipliers[0] += 1 : multipliers[1] += 1

      end
    end

    @schedule[0] * multipliers[0]

  end

end
