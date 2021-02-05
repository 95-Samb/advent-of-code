class PassportValidator
  def amount_with_required_fields(input)
    input.keep_if { |e| passport_validation(e)}
    input.length
  end

  def passport_validation(passport)
    passport_data = passport.split(" ").map { |e| e.split(":")  }.to_h
    key_data = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
    (key_data - passport_data.keys).empty?
  end

  def valid_fields?(passport)
    true
  end

end
