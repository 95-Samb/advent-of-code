class PassportValidator
  def amount_with_required_fields(input)
    input.keep_if { |e| passport_validation(e)}
    input.length
  end

  def amount_with_valid_fields(input)
    input.keep_if { |e| passport_validation(e)}
    input.keep_if { |e| valid_fields?(e)}
    input.length
  end


  def passport_validation(passport)
    passport_data = passport.split(" ").map { |e| e.split(":")  }.to_h
    key_data = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
    (key_data - passport_data.keys).empty?
  end

  def valid_fields?(passport)
    passport_data = passport.split(" ").map { |e| e.split(":")  }.to_h
    field_requirements(passport_data)
  end

  def field_requirements(field_hash)
    [field_hash["byr"].to_i <= 2002 && field_hash["byr"].to_i >= 1920,
    field_hash["iyr"].to_i <= 2020 && field_hash["iyr"].to_i >= 2010,
    field_hash["eyr"].to_i <= 2030 && field_hash["eyr"].to_i >= 2020 ,
    if field_hash["hgt"][-2..-1] == "in"
      field_hash["hgt"][0..-3].to_i <= 76 &&
      field_hash["hgt"][0..-3].to_i >= 59
    elsif field_hash["hgt"][-2..-1] == "cm"
      field_hash["hgt"][0..-3].to_i <= 193
      field_hash["hgt"][0..-3].to_i >= 150
    else false
    end,
    field_hash["hcl"][0] == "#" && field_hash["hcl"][1..-1].delete("\W").length == 6,
    ["amb","blu","brn","gry","grn","hzl","oth"].include?(field_hash["ecl"]),
    field_hash["pid"].delete("\D").length == 9].inject(:&)
  end


end
