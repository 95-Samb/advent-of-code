# frozen_string_literal: true

class InputConverter
  def convert(input)
    input.split(",").map(&:to_i)
  end
end
