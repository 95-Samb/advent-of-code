# frozen_string_literal: true

require_relative '../find_checksum'

describe FindChecksum do
  shared_examples 'it returns' do |parameter|
    it parameter.to_s do
      expect(subject.send(input)).to eq(parameter)
    end
  end
  context 'for []' do
    let(:input) { [] }
    it_behaves_like 'it returns', nil
  end
  context 'for generic nil returning inputs' do
    context 'for [a]' do
      let(:input) { ['a'] }
      it_behaves_like 'it returns', 0
    end
    context 'for [b]' do
      let(:input) { ['b'] }
      it_behaves_like 'it returns', 0
    end
    context 'for [ab]' do
      let(:input) { ['ab'] }
      it_behaves_like 'it returns', 0
    end
    context 'for [a,c]' do
      let(:input) { %w[a c] }
      it_behaves_like 'it returns', 0
    end
    context 'for [abc,c]' do
      let(:input) { %w[abc c] }
      it_behaves_like 'it returns', 0
    end
  end
  context 'for atleast 1 non zero input' do
    context 'for [aab,ccc]' do
      let(:input) { %w[aab ccc] }
      it_behaves_like 'it returns', 1
    end
    context 'for [aab,cde]' do
      let(:input) { %w[aab cde] }
      it_behaves_like 'it returns', 0
    end
    context 'for [abd,ccc]' do
      let(:input) { %w[abd ccc] }
      it_behaves_like 'it returns', 0
    end
    context 'for [abd,ccc,bce]' do
      let(:input) { %w[abd ccc bce] }
      it_behaves_like 'it returns', 0
    end
    context 'for [abd,ccc,bbe]' do
      let(:input) { %w[abd ccc bbe] }
      it_behaves_like 'it returns', 1
    end
  end
end
