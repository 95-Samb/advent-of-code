class FindRepeatFrequency
  def execute(input)
    first_input = input[0]
    second_input = input[1] 

    if input.length == 1 
      if input[0] == 0
        return first_input
      else
        return nil
      end
    end

    if first_input.abs <= second_input.abs
      if first_input.abs * 2 >= second_input.abs
        unless first_input.positive? == second_input.positive? 
          0
        end
      end 
    elsif first_input.abs >= second_input.abs
      first_input
    end
  end
end
 