class PassportValidator
  def execute(input)
    input.map{ |e| password_validation(e)}.count(true)
  end

  def password_validation(password)
    passport_data = password.split(" ").map { |e| e.split(":")  }.to_h
    key_data = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
    (key_data - passport_data.keys).empty?
  end

end
