require_relative "../password_finder"

describe PasswordFinder do
  context "for duplicate_number method" do
    it "returns true for 11" do
      expect(PasswordFinder.new.duplicate_number(11)).to eq(true)
    end
  end
end
