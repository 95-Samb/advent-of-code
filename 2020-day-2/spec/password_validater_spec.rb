require_relative "../password_validater"

describe PasswordValidater do
  it "returns nil for [1-1 a: b]" do
    expect(PasswordValidater.new.execute(["1-1 a: b"])).to eq(nil)
  end
  it "returns 1 for [1-1 a: a]" do
    expect(PasswordValidater.new.execute(["1-1 a: a"])).to eq(1)
  end
  it "returns 1 for [1-1 b: b]" do
    expect(PasswordValidater.new.execute(["1-1 b: b"])).to eq(1)
  end
  it "returns 1 for [1-1 b: ab]" do
    expect(PasswordValidater.new.execute(["1-1 b: ab"])).to eq(1)
  end
end
