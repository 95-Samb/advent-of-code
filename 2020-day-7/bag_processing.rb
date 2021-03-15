class BagProcessing

  def initialize(bags)
    @bags = bags
  end

  def totally_contains(bag)
    directly_contained = directly_contains(bag)
    indirectly_contained = []
    totally_contained = directly_contained
    until directly_contained.empty? do
      directly_contained.each { |e|  indirectly_contained.push(directly_contains(e))}
      totally_contained += indirectly_contained
      directly_contained = indirectly_contained.flatten
      indirectly_contained = []
    end
    totally_contained.flatten.uniq
  end

  def directly_contains(bag)
    contains = []

    @bags.each do  |e|
      if e[:contents][bag]
        contains.push(e[:name])
      end
    end

    contains
  end

  def total_bags(bag)
    current_bags = @bags.select { |e| e[:name] == bag  }
    next_bags = []
    total = 0
    until current_bags.empty?
      current_bags.each { |e|
        contents = hash_expander(e[:contents])
        total += contents.length
        contents.each { |x|  next_bags += @bags.select { |e| e[:name] == x  }}
      }
      current_bags = next_bags
      next_bags = []
    end
    total != 0 ? total : nil
  end

  def hash_expander(hash)
    output = []
    hash.each { |e| e[1].times do output.push(e[0]) end  }
    output
  end
end
