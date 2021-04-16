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

    it "returns blank for [5,1,2,3] and preamble 3" do
      expect(AdditionSystem.new([5,1,2,3]).no_pair_sum(3)).
      to eq([])
    end

    it "returns 3 for [1,5,6,3] and preamble 2" do
      expect(AdditionSystem.new([1,5,6,3]).no_pair_sum(2)).
      to eq([3])
    end

    it "returns 3 and 2 for [1,5,2,3] and preamble 2" do
      expect(AdditionSystem.new([1,5,2,3]).no_pair_sum(2)).
      to eq([2,3].sort)
    end

    it "returns 2 for [0,1,2,3] and preamble 2" do
      expect(AdditionSystem.new([0,1,2,3]).no_pair_sum(2)).
      to eq([2])
    end

    subject = [35,20,15,25,47,40,62,55,65,95,102,117,150,182,127,219,299,277,309]

    it "returns 127 for #{subject} and preamble 5" do
      expect(AdditionSystem.new(subject).no_pair_sum(5).sort).
      to eq([127].sort)
    end


  end

  context "for continuous sum method" do

    it "returns 1,2 for [1,2] and 3" do
      expect(AdditionSystem.new([1,2]).continuous_sum(3)).to eq([1,2])
    end

    it "returns nil for [1,2] and 4" do
      expect(AdditionSystem.new([1,2]).continuous_sum(4)).to eq(nil)
    end

    it "returns 1,2 for [1,2,4] and 3" do
      expect(AdditionSystem.new([1,2,4]).continuous_sum(3)).to eq([1,2])
    end

  end

end
