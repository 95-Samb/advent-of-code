class PasswordValidater
  def execute(input)
    formatted_passwords = password_formatter(input[0])
    return 1 if password_validater(formatted_passwords)
  end

  def password_formatter(input)
    formatted_input = input.split(" ")
    formatted_input[0] = formatted_input[0].split("-").map(&:to_i)
    formatted_input[1].chop!
    formatted_input.flatten
  end

  def password_validater(input)
    if input[3].include? input[2]
      true if input[3].count(input[2]) >= input[0] && input[3].count(input[2]) <= input[1]
    else
    end
  end
end
