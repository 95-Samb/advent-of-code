require_relative "../customs_form"

describe CustomsForm do
  it "returns 1 for a" do
    expect(CustomsForm.new.yes_answers("a")).to eq(1)
  end
end
