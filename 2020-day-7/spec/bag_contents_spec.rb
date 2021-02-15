require_relative "../bag_contents"

describe BagContents do
  it "returns 1 shiny gold bag for bright white bags contain 1 shiny gold bag." do
    expect(BagContents.new.execute("bright white bags contain 1 shiny gold bag.")).
    to eq({"shiny gold bag" => 1})
  end
  it "returns 1 shiny green bag for bright white bags contain 1 shiny green bag." do
    expect(BagContents.new.execute("bright white bags contain 1 shiny green bag.")).
    to eq({"shiny green bag" => 1})
  end
  subject = "light red bags contain 1 bright white bag, 1 muted yellow bag."
  it "returns 1 bright white bag, 1 muted yellow bag for #{subject}" do
    expect(BagContents.new.execute(subject)).
    to eq({"bright white bag" => 1,"muted yellow bag" => 1})
  end
  subject2 = "light red bags contain 1 bright white bag, 2 muted yellow bags."
  it "returns 1 bright white bag, 2 muted yellow bags for #{subject2}" do
    expect(BagContents.new.execute(subject2)).
    to eq({"bright white bag" => 1,"muted yellow bag" => 2})
  end

end
