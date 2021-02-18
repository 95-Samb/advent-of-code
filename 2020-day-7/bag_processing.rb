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
end
