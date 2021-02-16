class BagProcessing

  def initialize(bags)
    @bags = bags
  end

  def totally_contains(bag)
    directly_contained = directly_contains(bag)
    indirectly_contained = directly_contains(directly_contained[0])
    directly_contained + indirectly_contained
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
