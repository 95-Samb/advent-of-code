require_relative "../password_validater"

describe PasswordValidater do
  it "returns nil for [1-1 a: b]" do
    expect(PasswordValidater.new.execute(["1-1 a: b"])).to eq(nil)
  end
end
