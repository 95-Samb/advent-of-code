require_relative "../bag_processing"

describe BagProcessing do
  subject = [{name:"bright white bag",contents:{"shiny gold bag" => 1}}]
  subject2 = [{name:"bright white bag",contents:{"shiny gold bag" => 1}},
    {name:"matte white bag",contents:{"shiny gold bag" => 1}}]
  it "returns bright white bag for subject and shiny gold bag" do
    expect(BagProcessing.new(subject).directly_contains("shiny gold bag")).
    to eq(["bright white bag"])
  end
  it "returns bright white bag and matte white bag for subject and shiny gold bag" do
    expect(BagProcessing.new(subject2).directly_contains("shiny gold bag")).
    to eq(["bright white bag","matte white bag"])
  end
end
