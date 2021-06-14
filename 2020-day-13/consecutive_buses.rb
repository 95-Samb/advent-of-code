class ConsecutiveBuses

  def initialize(schedule)
    @schedule = schedule
  end

  def consecutive_start
    return nil if @schedule[0].even? && @schedule[1].even?
    multipliers = [1] * @schedule.length
    until @schedule[1] * multipliers[1] - @schedule[0] * multipliers[0] == 1
      @schedule[1] * multipliers[1] > @schedule[0] * multipliers[0] ?
      multipliers[0] += 1 : multipliers[1] += 1

    end

    @schedule[0] * multipliers[0]
  end

end
