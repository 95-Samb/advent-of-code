require_relative "../bag_processing"

describe BagProcessing do
  context "#directly_contains" do
    subject = [{name:"bright white bag",contents:{"shiny gold bag" => 1}}]
    subject2 = [{name:"bright white bag",contents:{"shiny gold bag" => 1}},
      {name:"matte white bag",contents:{"shiny gold bag" => 1}}]
    it "returns bright white bag for #{subject} and shiny gold bag" do
      expect(BagProcessing.new(subject).directly_contains("shiny gold bag")).
      to eq(["bright white bag"])
    end
    it "returns bright white bag and matte white bag for #{subject2} and shiny gold bag" do
      expect(BagProcessing.new(subject2).directly_contains("shiny gold bag")).
      to eq(["bright white bag","matte white bag"])
    end
  end
  context "#totally_contains" do

    subject = [{name:"bright white bag",contents:{"shiny gold bag" => 1}},
    {name:"matte white bag",contents:{"bright white bag" => 1}}]

    subject2 = [{name:"bright white bag",contents:{"shiny gold bag" => 1}},
    {name:"bright yellow bag",contents:{"bright white bag" => 1}}]

    subject3 = [{name:"bright white bag",contents:{"shiny gold bag" => 1}},
    {name:"bright yellow bag",contents:{"bright white bag" => 1}},
    {name:"bright pink bag",contents:{"bright yellow bag" => 1}}]

    subject4 = [{name:"bright white bag",contents:{"shiny gold bag" => 1}},
    {name:"bright yellow bag",contents:{"bright white bag" => 1}},
    {name:"bright pink bag",contents:{"bright yellow bag" => 1}},
    {name:"bright blue bag",contents:{"bright pink bag" => 1}},
    {name:"bright green bag",contents:{"bright blue bag" => 1}}]

    subject5 = [{name:"bright white bag",contents:{"shiny gold bag" => 1}},
    {name:"bright yellow bag",contents:{"bright white bag" => 1}},
    {name:"bright pink bag",contents:{"bright yellow bag" => 1}},
    {name:"bright blue bag",contents:{"bright orange bag" => 1}},
    {name:"bright green bag",contents:{"bright orange bag" => 1}}]

    subject6 = [{name:"bright white bag",contents:{"shiny gold bag" => 1}},
    {name:"bright yellow bag",contents:{"bright white bag" => 1}},
    {name:"bright pink bag",contents:{"bright yellow bag" => 1, "bright orange bag" => 2}},
    {name:"bright blue bag",contents:{"bright orange bag" => 1, "shiny gold bag" => 10}},
    {name:"bright green bag",contents:{"bright orange bag" => 1, "shiny gold bag" => 9}}]

    it "returns bright white bag and matte white bag for #{subject} and shiny gold bag" do
      expect(BagProcessing.new(subject).totally_contains("shiny gold bag")).
      to eq(["bright white bag","matte white bag"])
    end

    it "returns bright white bag and bright yellow bag for #{subject2} and shiny gold bag" do
      expect(BagProcessing.new(subject2).totally_contains("shiny gold bag")).
      to eq(["bright white bag","bright yellow bag"])
    end

    it "returns bright white bag,bright yellow bag and bright pink bag
    for #{subject3} and shiny gold bag" do
      expect(BagProcessing.new(subject3).totally_contains("shiny gold bag")).
      to eq(["bright white bag","bright yellow bag","bright pink bag"])
    end

    it "returns bright white bag,bright yellow bag,bright pink bag, bright blue bag
    and bright green bag for #{subject4} and shiny gold bag" do
      expect(BagProcessing.new(subject4).totally_contains("shiny gold bag")).
      to eq(["bright white bag","bright yellow bag","bright pink bag",
        "bright blue bag", "bright green bag"])
    end

    it "returns bright white bag,bright yellow bag,bright pink bag
    for #{subject5} and shiny gold bag" do
      expect(BagProcessing.new(subject5).totally_contains("shiny gold bag")).
      to eq(["bright white bag","bright yellow bag","bright pink bag"])
    end

    it "returns bright white bag,bright yellow bag,bright pink bag, bright blue bag
    and bright green bag for #{subject6} and shiny gold bag" do
      expect(BagProcessing.new(subject6).totally_contains("shiny gold bag").sort).
      to eq(["bright white bag","bright yellow bag","bright pink bag",
        "bright blue bag", "bright green bag"].sort)
    end

  end

  context "#total_bags" do

    subject = [{name:"shiny gold bag",contents:{"bright red bag" => 1}}]

    subject2 = [{name:"shiny gold bag",contents:{"bright red bag" => 2,
      "bright white bag" => 2}}]

    subject3 = [{name:"shiny gold bag",contents:{"bright red bag" => 1}},
    {name:"bright red bag",contents:{"bright white bag" => 1}}]

    subject4 = [{name:"shiny gold bag",contents:{"bright pink bag" => 3}},
    {name:"bright pink bag",contents:{"bright white bag" => 3}}]

    it "returns nil for []" do
      expect(BagProcessing.new([]).total_bags("shiny gold bag")).
      to eq(nil)
    end

    it "returns 1 for #{subject}" do
      expect(BagProcessing.new(subject).total_bags("shiny gold bag")).
      to eq(1)
    end

    it "returns 4 for #{subject2}" do
      expect(BagProcessing.new(subject2).total_bags("shiny gold bag")).
      to eq(4)
    end

    it "returns 2 for #{subject3}" do
      expect(BagProcessing.new(subject3).total_bags("shiny gold bag")).
      to eq(2)
    end

    it "returns 12 for #{subject4}" do
      expect(BagProcessing.new(subject4).total_bags("shiny gold bag")).
      to eq(12)
    end

  end

  context "#hash_expander" do

    it "returns a,a,a for {a => 3}" do
      expect(BagProcessing.new([]).hash_expander({"a" => 3})).
      to eq(["a","a","a"])
    end

    it "returns a,a,b,b,c,c for {a => 2,b => 2,c => 2}" do
      expect(BagProcessing.new([]).hash_expander({"a" => 2,"b" => 2,"c" => 2})).
      to eq(["a","a","b","b","c","c"])
    end
  end



end
