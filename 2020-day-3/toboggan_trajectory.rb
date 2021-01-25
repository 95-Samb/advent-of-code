class TobogganTrajectory

  def trees_hit(input,down,right)
    @input = input
    i = 1
    total_trees_hit = 0
    def hits_tree(point)
      @input[point][point * 3 % @input[point].length] == "#"
    end
    while i < input.length
      hits_tree(i) ? total_trees_hit += 1 : nil
      i += 1
    end
    total_trees_hit
  end

end
