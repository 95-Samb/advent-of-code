class BagContents
  def execute(input)
    contents = input.split("contain ")[1]
    {contents[2..-2] => contents[0].to_i}
  end
end
