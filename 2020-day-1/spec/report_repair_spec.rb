require_relative "../report_repair"

describe ReportRepair do
  context "for execute method" do

    it "returns nil for empty string" do
      expect(ReportRepair.new.execute("",2)).to eq(nil)
    end

    it "returns nil for array with no valid values" do
      expect(ReportRepair.new.execute([],2)).to eq(nil)
    end

    it "returns 2019 for array with 1 and 2019" do
      expect(ReportRepair.new.execute([1,2019],2)).to eq(2019)
    end

    it "returns 2019 for array with 1,2019,2" do
      expect(ReportRepair.new.execute([1,2019,2],2)).to eq(2019)
    end

    it "returns 2019 for array with 2,2019,1" do
      expect(ReportRepair.new.execute([2,2019,1],2)).to eq(2019)
    end

    it "returns 2019 for array with 2019,2,1" do
      expect(ReportRepair.new.execute([2019,2,1],2)).to eq(2019)
    end

    it "returns 2019 for array with 2019,2,1,3,4,5,6,7" do
      expect(ReportRepair.new.execute([2019,2,1,3,4,5,6,7],2)).to eq(2019)
    end

    it "returns nil for array with 1,2,3,4,5,6,7,8,9" do
      expect(ReportRepair.new.execute([1,2,3,4,5,6,7,8,9],2)).to eq(nil)
    end
  end

  context "for find correct set method for pair " do
    it "returns 1,2019 for array with 2019,2,1,3,4,5,6,7" do
      expect(ReportRepair.new.find_correct_set([2019,2,1,3,4,5,6,7],2)).to eq([1,2019])
    end
    it "returns 20,2000 for array with 2000,20,1,3,4,5,6,7" do
      expect(ReportRepair.new.find_correct_set([2000,20,1,3,4,5,6,7],2)).to eq([20,2000])
    end
  end

  context "for find correct set method for trio" do
    it "returns 1,19,2000 for array with 2000,19,1,3,4,5,6,7" do
      expect(ReportRepair.new.find_correct_set([2000,19,1,3,4,5,6,7],3)).to eq([1,19,2000])
    end
  end
end
