require_relative '../frequency_app.rb'


describe FrequencyTracker do
	it "returns 0 for [0]" do
		expect(subject.analyse([0])).to eq(0)
	end
	it "returns 1 for [0,1]" do
		expect(subject.analyse([0,1])).to eq(1)
	end
end