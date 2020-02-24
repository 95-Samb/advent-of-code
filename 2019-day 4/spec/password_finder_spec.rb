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
    it "returns true for 112" do
      expect(PasswordFinder.new.increasing_digits?(112)).to eq(true)
    end
    it "returns false for 121" do
      expect(PasswordFinder.new.increasing_digits?(121)).to eq(false)
    end
    it "returns true for 122234" do
      expect(PasswordFinder.new.increasing_digits?(122234)).to eq(true)
    end
    it "returns false for 122243" do
      expect(PasswordFinder.new.increasing_digits?(122243)).to eq(false)
    end
    it "returns false for 123432" do
      expect(PasswordFinder.new.increasing_digits?(123432)).to eq(false)
    end
    it "returns true for 122334" do
      expect(PasswordFinder.new.increasing_digits?(122334)).to eq(true)
    end
  end
  context "for the execute method" do
    it "returns 0 for 19 and 20" do
      expect(PasswordFinder.new.execute(19,20)).to eq(0)
    end
    it "returns 1 for 11 and 12" do
      expect(PasswordFinder.new.execute(11,12)).to eq(1)
    end
    it "returns 10 for 111 and 122" do
      expect(PasswordFinder.new.execute(111,122)).to eq(10)
    end
  end
  context "for the has_adjacent_pair? method" do
    it "returns true for 11" do
      expect(PasswordFinder.new.has_adjacent_pair?(11)).to eq(true)
    end
    it "returns false for 111" do
      expect(PasswordFinder.new.has_adjacent_pair?(111)).to eq(false)
    end
    it "returns true for 1122" do
      expect(PasswordFinder.new.has_adjacent_pair?(1122)).to eq(true)
    end
    it "returns true for 111122" do
      expect(PasswordFinder.new.has_adjacent_pair?(111122)).to eq(true)
    end
    it "returns false for 111222" do
      expect(PasswordFinder.new.has_adjacent_pair?(111222)).to eq(false)
    end
    it "returns true for 112345" do
      expect(PasswordFinder.new.has_adjacent_pair?(112345)).to eq(true)
    end
  end
  context "for the second execute method" do
    it "returns [122,112] for [111,122,222,112]" do
      expect(PasswordFinder.new.second_execute([111,122,222,112])).to eq([122,112])
    end
  end
end
