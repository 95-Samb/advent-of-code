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
    return nil if !index_array.include?(@bootcode.length - 1) &&
    @condition == "last instruction"
    total

  end

  def identify_instructions(instruction)
    index_array = []
    @bootcode.each_index { |i| index_array.push(i) if @bootcode[i][instruction] }
    index_array
  end

  def infinite_fix
    nop_instructions = identify_instructions(:nop)
    jmp_instructions = identify_instructions(:jmp)
    output = []

    jmp_instructions.each do |e|
      @bootcode[e][:nop] = @bootcode[e].delete :jmp
      output.push(BootCodeComputer.new(@bootcode,"last instruction").execute)
      @bootcode[e][:jmp] = @bootcode[e].delete :nop
    end

    nop_instructions.each do |e|
      @bootcode[e][:jmp] = @bootcode[e].delete :nop
      output.push(BootCodeComputer.new(@bootcode,"last instruction").execute)
      @bootcode[e][:nop] = @bootcode[e].delete :jmp
    end
    output
  end
end
