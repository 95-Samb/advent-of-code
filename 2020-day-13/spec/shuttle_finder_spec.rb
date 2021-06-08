require_relative "../shuttle_finder"

describe ShuttleFinder do

  context "#earliest_bus" do

    it "returns 1,1 for 1,[1]" do
      expect(ShuttleFinder.new(1,[1]).earliest_bus).to eq ([1,1])
    end

    it "returns nil for 0,[]" do
      expect(ShuttleFinder.new(0,[]).earliest_bus).to eq (nil)
    end

    it "returns 1,1 for 0,[1]" do
      expect(ShuttleFinder.new(0,[1]).earliest_bus).to eq ([1,1])
    end

    it "returns 2,2 for 2,[2,3]" do
      expect(ShuttleFinder.new(2,[2,3]).earliest_bus).to eq ([2,2])
    end

    it "returns 2,2 for 2,[3,2]" do
      expect(ShuttleFinder.new(2,[3,2]).earliest_bus).to eq ([2,2])
    end

    it "returns 5,5 for 5,[5,2]" do
      expect(ShuttleFinder.new(5,[5,2]).earliest_bus).to eq ([5,5])
    end

  end

end
