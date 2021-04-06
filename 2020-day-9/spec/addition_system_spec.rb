require_relative "../addition_system"

describe AdditionSystem do

  context "for no sum method with irrelevant preamble" do

    it "returns blank for empty input" do
      expect(AdditionSystem.new([]).no_sum(2)).
      to eq([])
    end

    it "returns 4 for [1,2,4]" do
      expect(AdditionSystem.new([1,2,4]).no_sum(2)).
      to eq([4])
    end

    it "returns blank for [1,2,3]" do
      expect(AdditionSystem.new([1,2,3]).no_sum(2)).
      to eq([])
    end

    it "returns blank for [10,1,2,3] and preamble 3" do
      expect(AdditionSystem.new([10,1,2,3]).no_sum(3)).
      to eq([])
    end

  end

end