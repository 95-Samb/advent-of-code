class BootCodeComputer
  def initialize(bootcode,condition)
    @bootcode = bootcode
    @condition = condition
  end

  def execute
    total = 0
    i = 0
    index_array = [0]

    until index_array != index_array.uniq

      total += @bootcode[i][:acc] if @bootcode[i][:acc]

      i += (@bootcode[i][:jmp] ? @bootcode[i][:jmp] : 1)
      i = i % @bootcode.length

      index_array.push(i)

    end
    total

  end
end
