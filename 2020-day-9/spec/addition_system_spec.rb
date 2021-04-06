require_relative "../addition_system"

describe AdditionSystem do

  context "for no sum method" do

    it "returns blank for empty imput" do
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

  end

end
