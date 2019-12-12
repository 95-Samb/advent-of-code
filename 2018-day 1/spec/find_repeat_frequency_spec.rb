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

  context 'for arrays converging to 0' do
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

    context 'for [2, -3]' do
      let(:input) { [2, -3] }
      it_behaves_like 'it returns', 0
    end

    context 'for [7, -8]' do
      let(:input) { [7, -8] }
      it_behaves_like 'it returns', 0
    end

    context 'for [-1, 1,-1]' do
      let(:input) { [-1, 1, -1] }
      it_behaves_like 'it returns', 0
    end

    context 'for [1, -3, 2]' do
      let(:input) { [1, -3, 2] }
      it_behaves_like 'it returns', 0
    end

    context 'for [-4, 3, 2]' do
      let(:input) { [-4, 3, 2] }
      it_behaves_like 'it returns', 0
    end

    context 'for [3, -4, 2]' do
      let(:input) { [3, -4, 2] }
      it_behaves_like 'it returns', 0
    end

    context "and not returning 0" do

      context 'for [-4, 2, 3]' do
        let(:input) { [-4, 2, 3] }
        it_behaves_like 'it returns', -2
      end
      context "for [-5, 2, 4]" do
        let(:input) { [-5, 2, 4] }
        it_behaves_like "it returns", -3
      end
    end

  end

  context 'for arrays returning to first input' do
    context 'for [2, -1]' do
      let(:input) { [2, -1] }
      it_behaves_like 'it returns', 2
    end

    context 'for [-2, 1]' do
      let(:input) { [-2, 1] }
      it_behaves_like 'it returns', -2
    end

    context 'for [8, -7]' do
      let(:input) { [8, -7] }
      it_behaves_like 'it returns', 8
    end
    context 'for [2, 3, -4]' do
      let(:input) { [2, 3, -4] }
      it_behaves_like 'it returns', 2
    end
    context 'for [2, -4, 3]' do
      let(:input) { [2, -4, 3] }
      it_behaves_like 'it returns', 2
    end
  end

  context "for arrays returning not first_input or 0" do

    context 'for [3, 2, -4]' do
      let(:input) { [3, 2, -4] }
      it_behaves_like 'it returns', 5
    end

    context 'for [3, 5, -6]' do
      let(:input) { [3, 5, -6] }
      it_behaves_like 'it returns', 8
    end


  end

  context "for non-returning arrays" do
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
    context 'for [1, 1, -10]' do
      let(:input) { [1, 1, -10] }
      it_behaves_like 'it returns', nil
    end

    context 'for [-10, 1, 1]' do
      let(:input) { [-10, 1, 1] }
      it_behaves_like 'it returns', nil
    end

    xcontext "for [7,-5]" do
      let(:input) { [7,-5] }
      it_behaves_like "it returns", nil
    end
  end
end
