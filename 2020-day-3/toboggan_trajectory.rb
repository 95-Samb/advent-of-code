class TobogganTrajectory

  def trees_hit(input,down,right)
    @input = input
    @right = right
    @down = down
    i = 0
    j = 0
    total_trees_hit = 0
    def hits_tree(vertical_point,horizontal_point)
      @input[vertical_point][horizontal_point % @input[vertical_point].length] == "#"
    end
    until i + @down >= input.length
      i += @down
      j += @right
      hits_tree(i,j) ? total_trees_hit += 1 : nil
    end
    total_trees_hit
  end

  def least_trees_hit(input,slopes)
    slopes.map! { |e| trees_hit(input,*e)}
    slopes.inject(&:*)
  end

end
