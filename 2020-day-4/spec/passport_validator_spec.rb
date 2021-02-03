require_relative "../passport_validator"

describe PassportValidator do
  it "returns 1 for ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
    byr:1937 iyr:2017 cid:147 hgt:183cm" do
    expect(PassportValidator.new.execute("ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
    byr:1937 iyr:2017 cid:147 hgt:183cm")).to eq(1)
  end
  it "returns 0 for iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
    hcl:#cfa07d byr:1929" do
    expect(PassportValidator.new.execute("iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
    hcl:#cfa07d byr:1929")).to eq(0)
  end
end
