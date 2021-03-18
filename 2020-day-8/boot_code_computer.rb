class BootCodeComputer
  def initialize(bootcode)
    @bootcode = bootcode
  end

  def execute
    total = 0
    @bootcode.each do |e|
      if e[:acc]
        total += e[:acc]
      end
    end
    total

  end
end
