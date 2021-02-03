require_relative "../passport_validator"

describe PassportValidator do
  valid_passport = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm"
  invalid_passport = "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929"
  valid_north_pole = "hcl:#ae17e1 iyr:2013
      eyr:2024
      ecl:brn pid:760753108 byr:1931
      hgt:179cm"
  context "for single passport" do
    it "returns 1 for valid_passport" do
      expect(PassportValidator.new.password_validation(valid_passport)).to eq(true)
    end
    it "returns 0 for invalid_passport" do
      expect(PassportValidator.new.password_validation(invalid_passport)).to eq(false)
    end
    it "returns 1 for valid_north_pole" do
      expect(PassportValidator.new.password_validation(valid_north_pole)). to eq(true)
    end
  end
  context "for two passports" do
    it "returns 1 for a valid and a invalid pasport" do
      expect(PassportValidator.new.execute([valid_passport,invalid_passport])).to eq(1)
    end
    it "returns 1 for 2 valid_north_pole, 3 invalid pasport, 4 valid_passport" do
      expect(PassportValidator.new.execute([valid_north_pole] * 2 +
      [invalid_passport] * 3 + [valid_passport] * 4)).to eq(6)
    end
  end
end
