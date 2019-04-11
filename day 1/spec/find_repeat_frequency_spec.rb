require_relative '../find_repeat_frequency'

describe FindRepeatFrequency do
  shared_examples "it returns" do |parameter|
    it "#{parameter}" do
      expect(subject.execute(input)).to eq(parameter)
    end
  end

  context 'for [1]' do
    let(:input) { [1] }
    it_behaves_like 'it returns', nil
  end

  context 'for [-1, 1]' do
    let(:input) { [-1, 1] }
    it_behaves_like 'it returns', 0
  end

  context 'for [1, -1]' do
    let(:input) { [1, -1] }
    it_behaves_like 'it returns', 0
  end

  context 'for [2, -2]' do
    let(:input) { [2, -2] } 
    it_behaves_like 'it returns', 0
  end

  context 'for [1, -2]' do
    let(:input) { [1, -2] } 
    it_behaves_like 'it returns', 0
  end

  context 'for [-1, 2]' do
    let(:input) { [-1, 2] }
    it_behaves_like 'it returns', 0
  end

  context 'for [2, -1]' do
    let(:input) { [2, -1] } 
    it_behaves_like 'it returns', 2
  end

  context 'for [-2, 1]' do
    let(:input) { [-2, 1] } 
    it_behaves_like 'it returns', -2
  end

  xcontext 'for [2, -3]' do
    let(:input) { [2, -3] } 
    it_behaves_like 'it returns', 0
  end

  xcontext 'for [-1, 1,-1]' do
    let(:input) { [-1, 1, -1] }
    it_behaves_like 'it returns', 0
  end
end
