class ShipNavigator

  def initialize
    @data = [0,0,"east"]
  end

  def take_action(action)
    if action[0] == "E"
      @data = [action[1].to_i,0,"east"]
    elsif action[0] == "N"
      @data = [0,action[1].to_i,"east"]
    elsif action[0] == "S"
      @data = [0,-action[1].to_i,"east"]
    else @data = [-action[1].to_i,0,"east"]
    end
  end

end
