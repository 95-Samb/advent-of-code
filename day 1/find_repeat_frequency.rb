class FindRepeatFrequency
  def execute(input)
    if input.all? { |e| e.positive?}
      nil
    elsif input[0].zero? && input.length > 1
      nil
    else
      input[0] + (input[1] || 0)
    end
  end
end
