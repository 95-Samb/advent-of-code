class PasswordValidater
  def execute(input)
    formatted_passwords = input[0].split(" ")
    return 1 if formatted_passwords[2].split("").any?(formatted_passwords[1][0])
  end

  def password_formatter(input)
    formatted_input = input.split(" ")
    formatted_input[0] = formatted_input[0].split("-")
    formatted_input[1].chop!
    formatted_input.flatten
  end

  def password_validater(input)
    true if input[2] == input[3]
  end
end
