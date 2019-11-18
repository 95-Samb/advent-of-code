class FindSimilarBoxIdLetters
  def send(input)
    return nil if input.empty?

    return (input[0].chars & input[1].chars).join if input[0][0] == input[1][0]
    return (input[0].chars & input[1].chars).join if input[0][1] == input[1][1]
  end
end
