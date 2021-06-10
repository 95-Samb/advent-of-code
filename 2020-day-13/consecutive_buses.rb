class ConsecutiveBuses

  def initialize(schedule)
    @schedule = schedule
  end

  def consecutive_start
    return nil if @schedule[0].even? && @schedule[1].even?
    i = 1
    j = 1
    until @schedule[1] * i - @schedule[0] * j == 1
      @schedule[1] * i > @schedule[0] * j ? j += 1 : i += 1

    end

    @schedule[0] * j
  end

end
