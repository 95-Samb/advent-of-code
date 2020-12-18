class PasswordValidater
  def execute(input)
    formatted_passwords = input[0].split(" ")
    return 1 if formatted_passwords[2].split("").any?(formatted_passwords[1][0])
  end
end
