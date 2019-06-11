require_relative '../find_repeat_frequency'

describe FindRepeatFrequency do
  shared_examples "it returns" do |parameter|
    it "#{parameter}" do
      expect(subject.execute(input)).to eq(parameter)
    end
  end

  context 'for single numbers' do
    context 'for [1]' do
      let(:input) { [1] }
      it_behaves_like 'it returns', nil
    end

    context 'for [-1]' do
      let(:input) { [-1] }
      it_behaves_like 'it returns', nil
    end

    context 'for [0]' do
      let(:input) { [0] }
      it_behaves_like 'it returns', 0
    end
  end

  context 'for two numbers' do
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

    context 'for [2, -3]' do
      let(:input) { [2, -3] }
      it_behaves_like 'it returns', 0
    end

    context 'for [7, -8]' do
      let(:input) { [7, -8] }
      it_behaves_like 'it returns', 0
    end

    context 'for [8, -7]' do
      let(:input) { [8, -7] }
      it_behaves_like 'it returns', 8
    end

    context 'for [1, -3]' do
      let(:input) { [1, -3] }
      it_behaves_like 'it returns', nil
    end

    context 'for [1, 2]' do
      let(:input) { [1, 2] }
      it_behaves_like 'it returns', nil
    end

    context 'for [15, -7]' do
      let(:input) { [15, -7] }
      it_behaves_like 'it returns', nil
    end
  end

  context 'with three numbers' do
    context 'for [-1, 1,-1]' do
      let(:input) { [-1, 1, -1] }
      it_behaves_like 'it returns', 0
    end

    context 'for [1, -3, 2]' do
      let(:input) { [1, -3, 2] }
      it_behaves_like 'it returns', 0
    end

    context 'for [1, 1, -10]' do
      let(:input) { [1, 1, -10] }
      it_behaves_like 'it returns', nil
    end
  end

  xcontext 'with three numbers - ignored' do
    context 'for [2, 3, -4]' do
      let(:input) { [2, 3, -4] }
      it_behaves_like 'it returns', 2
    end

    context 'for [2, -4, 3]' do
      let(:input) { [2, 3, -4] }
      it_behaves_like 'it returns', 2
    end

    context 'for [3, 2, -4]' do
      let(:input) { [3, 2, -4] }
      it_behaves_like 'it returns', 5
    end

    context 'for [-4, 2, 3]' do
      let(:input) { [-4, 2, 3] }
      it_behaves_like 'it returns', -2
    end

    context 'for [-4, 3, 2]' do
      let(:input) { [-4, 3, 2] }
      it_behaves_like 'it returns', 0
    end

    context 'for [3, -4, 2]' do
      let(:input) { [3, -4, 2] }
      it_behaves_like 'it returns', 0
    end

    context 'for [-10, 1, 1]' do
      let(:input) { [-10, 1, 1] }
      it_behaves_like 'it returns', nil
    end

    context 'for [3, 5, -6]' do
      let(:input) { [3, 5, -6] }
      it_behaves_like 'it returns', 8
    end
  end
end
