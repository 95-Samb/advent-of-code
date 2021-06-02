class ShipNavigator

  def initialize
    @data = [0,0,"east"]
  end

  def take_action(action)
    if action == "E1"
      @data = [1,0,"east"]
    else @data = [-1,0,"east"]
    end
  end

end
