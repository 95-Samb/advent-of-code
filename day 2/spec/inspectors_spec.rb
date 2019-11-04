require_relative "../find_checksum"

describe FindChecksum do
  describe "for the double_inspector method" do
    shared_examples "it returns" do |parameter|
      it "#{parameter}" do
        expect(subject.double_inspector(input))
        .to eq(parameter)
      end
    end
    context "for [a]" do
      let(:input) {["a"]}
      it_behaves_like 'it returns', 0
    end
    context "for [bb]" do
      let(:input) {["bb"]}
      it_behaves_like 'it returns', 1
    end
    context "for [ab]" do
      let(:input) {["ab"]}
      it_behaves_like 'it returns', 0
    end
    context "for [abcdefghi]" do
      let(:input) {["abcdefghi"]}
      it_behaves_like 'it returns', 0
    end
    context "for [aabb]" do
      let(:input) {["aabb"]}
      it_behaves_like 'it returns', 1
    end
    context "for [aabbcdeff]" do
      let(:input) {["aabbcdeff"]}
      it_behaves_like 'it returns', 1
    end
  end
  describe "for the triple_inspector method" do
    shared_examples "it returns" do |parameter|
      it "#{parameter}" do
        expect(subject.triple_inspector(input))
        .to eq(parameter)
      end
    end
    context "for [abcdefghi]" do
      let(:input) {["abcdefghi"]}
      it_behaves_like 'it returns', 0
    end
    context "for [aabb]" do
      let(:input) {["aabb"]}
      it_behaves_like 'it returns', 0
    end
    context "for [aaabcde]" do
      let(:input) {["aaabcde"]}
      it_behaves_like 'it returns', 1
    end
    context "for [aaabbb]" do
      let(:input) {["aaabbb"]}
      it_behaves_like 'it returns', 1
    end
  end
end
