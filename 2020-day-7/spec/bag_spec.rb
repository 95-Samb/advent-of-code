require_relative "../bag"

describe Bag do

  subject = "light red bags contain 1 bright white bag, 1 muted yellow bag."
  subject2 = "light red bags contain 1 bright white bag, 2 muted yellow bags."

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

  end

  context "for name method" do

    it "returns light red bag for #{subject}" do
      expect(Bag.new(subject).name).to eq("light red bag")
    end

  end

end
