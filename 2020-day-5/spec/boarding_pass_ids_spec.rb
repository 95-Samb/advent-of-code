require_relative "../boarding_pass_ids"

describe BoardingPassIds do
  it "returns 5 for FFFFFFFLLL" do
    expect(BoardingPassIds.new.execute(["FFFFFFFLLL"])).to eq([5])
  end
end
