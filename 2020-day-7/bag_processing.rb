class BagProcessing

  def initialize(bags)
    @bags = bags
  end

  def directly_contains(bag)
    contains = []

    @bags.each do  |e|
      if e[:contents]["shiny gold bag"]
        contains.push(e[:name])
      end
    end

    contains
  end
end
