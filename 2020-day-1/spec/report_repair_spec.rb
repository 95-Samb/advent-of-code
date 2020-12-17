require_relative "../report_repair"

describe ReportRepair do

    it "returns nil for empty string" do
      expect(ReportRepair.new.execute("")).to eq(nil)
    end

    it "returns nil for array with no valid values" do
      expect(ReportRepair.new.execute([])).to eq(nil)
    end

    it "returns 2019 for array with 1 and 2019" do
      expect(ReportRepair.new.execute([1,2019])).to eq(2019)
    end

    it "returns 2019 for array with 1,2019,2" do
      expect(ReportRepair.new.execute([1,2019,2])).to eq(2019)
    end

    it "returns 2019 for array with 2,2019,1" do
      expect(ReportRepair.new.execute([2,2019,1])).to eq(2019)
    end

    it "returns 2019 for array with 2019,2,1" do
      expect(ReportRepair.new.execute([2019,2,1])).to eq(2019)
    end
end
