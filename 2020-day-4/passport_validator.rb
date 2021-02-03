class PassportValidator
  def execute(input)
    passport_data = input.split(" ").map { |e| e.split(":")  }.to_h
    key_data = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
    (key_data - passport_data.keys).empty?  ? 1 : 0
  end
end
