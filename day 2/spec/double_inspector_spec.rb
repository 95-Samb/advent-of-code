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
  end
end
