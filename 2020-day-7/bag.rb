class Bag

  def initialize(description)
    @description = description
  end

  def contents
    content = @description.chop.split("contain ")[1].split(", ")
    content_hash = {}
    content.each { |e|
      if e[-1] == "s"
        content_hash[e[2..-2]] = e[0].to_i
      else content_hash[e[2..-1]] = e[0].to_i
      end}
    content_hash
  end

end
