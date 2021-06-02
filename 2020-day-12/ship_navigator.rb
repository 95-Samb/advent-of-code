class ShipNavigator

  def initialize
    @data = [0,0,"east"]
  end

  def take_action(action)
    if action[0] == "E"
      @data[0] += action[1].to_i
    elsif action[0] == "N"
      @data[1] += action[1].to_i
    elsif action[0] == "S"
      @data[1] -= action[1].to_i
    else @data[0] -= action[1].to_i
    end
  end

end
