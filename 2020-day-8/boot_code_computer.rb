class BootCodeComputer
  def initialize(bootcode)
    @bootcode = bootcode
  end

  def execute
    total = 0
    i = 0

    (@bootcode.length - 1).times do
      if @bootcode[i][:acc]
        total += @bootcode[i][:acc]
      elsif @bootcode[i][:jmp]
        i += @bootcode[i][:jmp]
        i % @bootcode.length
      end
    end
    total

  end
end
