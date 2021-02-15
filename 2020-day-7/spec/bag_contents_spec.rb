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

end
