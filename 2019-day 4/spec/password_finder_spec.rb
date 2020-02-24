require_relative "../password_finder"

describe PasswordFinder do
  context "for duplicate_adjacent_number method" do
    it "returns true for 11" do
      expect(PasswordFinder.new.duplicate_adjacent_number(11)).to eq(true)
    end
    it "returns false for 12" do
      expect(PasswordFinder.new.duplicate_adjacent_number(12)).to eq(false)
    end
    it "returns true for 22" do
      expect(PasswordFinder.new.duplicate_adjacent_number(22)).to eq(true)
    end
    it "returns false for 212" do
      expect(PasswordFinder.new.duplicate_adjacent_number(212)).to eq(false)
    end
    it "returns true for 221" do
      expect(PasswordFinder.new.duplicate_adjacent_number(221)).to eq(true)
    end
    it "returns true for 122345" do
      expect(PasswordFinder.new.duplicate_adjacent_number(122345)).to eq(true)
    end
    it "returns false for 123245" do
      expect(PasswordFinder.new.duplicate_adjacent_number(123245)).to eq(false)
    end
    it "returns true for 122225" do
      expect(PasswordFinder.new.duplicate_adjacent_number(122225)).to eq(true)
    end
  end
  context "for the increasing_digits? method" do
    it "returns true for 12" do
      expect(PasswordFinder.new.increasing_digits?(12)).to eq(true)
    end
    it "returns true for 21" do
      expect(PasswordFinder.new.increasing_digits?(21)).to eq(false)
    end
  end
end
