class BagContents
  def execute(input)
    contents = input.chop.split("contain ")[1].split(", ")
    contents_hash = {}
    contents.each { |e|
      if e[-1] == "s"
        contents_hash[e[2..-2]] = e[0].to_i
      else contents_hash[e[2..-1]] = e[0].to_i
      end}
    contents_hash
  end
end
