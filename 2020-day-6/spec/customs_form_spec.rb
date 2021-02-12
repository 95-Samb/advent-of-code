require_relative "../customs_form"

describe CustomsForm do
  it "returns 1 for a" do
    expect(CustomsForm.new.yes_answers("a")).to eq(1)
  end
  it "returns 0 for blank" do
    expect(CustomsForm.new.yes_answers("")).to eq(0)
  end
  it "returns 1 for aa" do
    expect(CustomsForm.new.yes_answers("aa")).to eq(1)
  end
  it "returns 5 for aabbccddee" do
    expect(CustomsForm.new.yes_answers("aabbccddee")).to eq(5)
  end
  it "returns 5 for aa\nbb\ncc\ndd\nee" do
    expect(CustomsForm.new.yes_answers("aa\nbb\ncc\ndd\nee")).to eq(5)
  end
end
