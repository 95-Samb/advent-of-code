class BootCodeFormatter

  def execute(input)
    array = input.split("\n").map(&:strip)
    array.map! { |e| e.split(" ")  }
    array.map do |e|
      {e[0].to_sym => e[1].to_i}
    end
  end


end
