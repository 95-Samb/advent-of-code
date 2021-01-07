class PasswordValidater
  def execute(input)
    formatted_passwords = input.map { |e| password_formatter(e)  }
    valid_passwords = formatted_passwords.map { |e| password_validater(e) }
    valid_passwords.count(true)
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
