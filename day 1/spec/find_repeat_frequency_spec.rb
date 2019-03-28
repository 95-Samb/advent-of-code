require_relative '../find_repeat_frequency'

describe FindRepeatFrequency do
  shared_examples "it returns" do |parameter|
    it "#{parameter}" do
      expect(subject.execute(input)).to eq(parameter)
    end
  end

  context 'for [0]' do
    let(:input) { [0] }
    it_behaves_like 'it returns', 0
  end

  context 'for [1, 0]' do
    let(:input) { [1, 0] }
    it_behaves_like 'it returns', 1
  end

  context 'for [2, 0]' do
    let(:input) { [2, 0] }
    it_behaves_like 'it returns', 2
  end

  context 'for [-1, 1]' do
    let(:input) { [-1, 1] }
    it_behaves_like 'it returns', 0
  end

  context 'for [-1, 1,-1]' do
    let(:input) { [-1, 1, -1] }
    it_behaves_like 'it returns', 0
  end
end
