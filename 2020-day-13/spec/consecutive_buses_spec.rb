require_relative "../consecutive_buses"

describe ConsecutiveBuses do

  context "#consecutive_start" do

    it "returns 1 for 1,2" do
      expect(ConsecutiveBuses.new([1,2]).consecutive_start).to eq(1)
    end

    it "returns 2 for 1,3" do
      expect(ConsecutiveBuses.new([1,3]).consecutive_start).to eq(2)
    end

    it "returns nil for 2,4" do
      expect(ConsecutiveBuses.new([2,4]).consecutive_start).to eq(nil)
    end

    it "returns 20 for 5,7" do
      expect(ConsecutiveBuses.new([5,7]).consecutive_start).to eq(20)
    end

    it "returns 20 for 18,29" do
      expect(ConsecutiveBuses.new([18,29]).consecutive_start).to eq(144)
    end

    xit "returns 3 for 1,2,5" do
      expect(ConsecutiveBuses.new([1,2,5]).consecutive_start).to eq(3)
    end

  end

end
