require_relative "../addition_system"

describe AdditionSystem do

  context "for no sum method with irrelevant preamble" do

    it "returns blank for empty input" do
      expect(AdditionSystem.new([]).no_pair_sum(2)).
      to eq([])
    end

    it "returns 4 for [1,2,4]" do
      expect(AdditionSystem.new([1,2,4]).no_pair_sum(2)).
      to eq([4])
    end

    it "returns blank for [1,2,3]" do
      expect(AdditionSystem.new([1,2,3]).no_pair_sum(2)).
      to eq([])
    end

    it "returns blank for [10,1,2,3] and preamble 3" do
      expect(AdditionSystem.new([10,1,2,3]).no_pair_sum(3)).
      to eq([])
    end

    it "returns 4 for [10,1,2,99,69,4] and preamble 5" do
      expect(AdditionSystem.new([10,1,2,99,69,4]).no_pair_sum(5)).
      to eq([4])
    end

  end

  context "for no sum method with relevant preamble" do

    it "returns blank for [5,1,2,3]" do
      expect(AdditionSystem.new([5,1,2,3]).no_pair_sum(3)).
      to eq([])
    end

    it "returns 3 for [1,5,6,3]" do
      expect(AdditionSystem.new([1,5,6,3]).no_pair_sum(2)).
      to eq([3])
    end

    it "returns 3 for [1,5,2,3]" do
      expect(AdditionSystem.new([1,5,2,3]).no_pair_sum(2).sort).
      to eq([3,2].sort)
    end

  end

end
