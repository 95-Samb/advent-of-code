require_relative "../bag_processing"

describe BagProcessing do
  context "for directly contains method" do
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
  context "for totally contains method" do

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
end
