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

    it "returns nil for 3,6" do
      expect(ConsecutiveBuses.new([3,6]).consecutive_start).to eq(nil)
    end

    it "returns 3 for 3,4" do
      expect(ConsecutiveBuses.new([3,4]).consecutive_start).to eq(3)
    end

    it "returns 20 for 5,7" do
      expect(ConsecutiveBuses.new([5,7]).consecutive_start).to eq(20)
    end

    it "returns 20 for 18,29" do
      expect(ConsecutiveBuses.new([18,29]).consecutive_start).to eq(144)
    end

    it "returns 1 for 1,0" do
      expect(ConsecutiveBuses.new([1,0]).consecutive_start).to eq(1)
    end

    it "returns 3 for 1,2,5" do
      expect(ConsecutiveBuses.new([1,2,5]).consecutive_start).to eq(3)
    end

    it "returns 24 for 3,5,13" do
      expect(ConsecutiveBuses.new([3,5,13]).consecutive_start).to eq(24)
    end

    it "returns 3417 for 17,0,13,19" do
      expect(ConsecutiveBuses.new([17,0,13,19]).consecutive_start).to eq(3417)
    end

    it "returns 754018 for 67,7,59,61" do
      expect(ConsecutiveBuses.new([67,7,59,61]).consecutive_start).to eq(754018)
    end

    it "returns 779210 for 67,0,7,59,61" do
      expect(ConsecutiveBuses.new([67,0,7,59,61]).consecutive_start).to eq(779210)
    end

    xit "returns 1261476 for 67,7,0,59,61" do
      expect(ConsecutiveBuses.new([67,7,0,59,61]).consecutive_start).to eq(1261476)
    end

  end

end
