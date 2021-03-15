require_relative "../bag"

describe Bag do

  subject = "light red bags contain 1 bright white bag, 1 muted yellow bag."
  subject2 = "light red bags contain 1 bright white bag, 2 muted yellow bags."
  subject3 = "drab bronze bags contain 5 plaid lavender bags, 1 muted yellow bag, 5 vibrant coral bags."
  subject4 = "pale magenta bags contain 1 clear gold bag, 5 posh fuchsia bags, 2 faded cyan bags."
  subject5 = "vibrant blue bags contain no other bags."

  context "for contents method" do

    it "returns 1 shiny gold bag for bright white bags contain 1 shiny gold bag." do
      expect(Bag.new("bright white bags contain 1 shiny gold bag.").contents).
      to eq({"shiny gold bag" => 1})
    end

    it "returns 1 shiny green bag for bright white bags contain 1 shiny green bag." do
      expect(Bag.new("bright white bags contain 1 shiny green bag.").contents).
      to eq({"shiny green bag" => 1})
    end

    it "returns 1 bright white bag, 1 muted yellow bag for #{subject}" do
      expect(Bag.new(subject).contents).
      to eq({"bright white bag" => 1,"muted yellow bag" => 1})
    end

    it "returns 1 bright white bag, 2 muted yellow bags for #{subject2}" do
      expect(Bag.new(subject2).contents).
      to eq({"bright white bag" => 1,"muted yellow bag" => 2})
    end

    it "returns 5 plaid lavender bags, 1 muted yellow bag and 5 vibrant coral bags
      for #{subject3}" do
      expect(Bag.new(subject3).contents).
      to eq({"plaid lavender bag" => 5,"muted yellow bag" => 1, "vibrant coral bag" => 5})
    end

    it "returns 1 clear gold bag, 5 posh fuchsia bags and 2 faded cyan bags
      for #{subject4}" do
      expect(Bag.new(subject4).contents).
      to eq({"clear gold bag" => 1,"posh fuchsia bag" => 5, "faded cyan bag" => 2})
    end

    it "returns {} for #{subject5}" do
      expect(Bag.new(subject5).contents).
      to eq({})
    end



  end

  context "for name method" do

    it "returns light red bag for #{subject}" do
      expect(Bag.new(subject).name).to eq("light red bag")
    end

  end

end
