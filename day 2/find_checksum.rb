# frozen_string_literal: true

class FindChecksum
  def send(input)
    return nil if input.empty?

    i = 0
    @double_sum = 0
    @triple_sum = 0

    while i < input.length
      @double_sum += 1 if double_inspector(input[i])
      @triple_sum += 1 if triple_inspector(input[i])
      i += 1
    end
    @double_sum * @triple_sum
  end

  def double_inspector(box_id)
    box_id.chars.any? { |e| box_id.count(e) == 2  } ?
      true : false
  end

  def triple_inspector(box_id)
    box_id.chars.any? { |e| box_id.count(e) == 3  } ?
      true : false
  end
end
