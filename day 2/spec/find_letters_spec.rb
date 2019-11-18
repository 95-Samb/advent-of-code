require_relative "../find_letters"

describe FindSimilarBoxIdLetters do
  shared_examples "it returns" do |parameter|
    it "#{parameter}" do
      expect(subject.send(input)).to eq(parameter)
    end
  end
  context "for []" do
    let(:input) {[]}
    it_behaves_like 'it returns', nil
  end
  context "for [ab,ac]" do
    let(:input) {["ab","ac"]}
    it_behaves_like 'it returns', "a"
  end
  context "for [ab,dc]" do
    let(:input) {["ab","dc"]}
    it_behaves_like 'it returns', nil
  end
  context "for [db,dc]" do
    let(:input) {["db","dc"]}
    it_behaves_like 'it returns', "d"
  end
  context "for [ab,cb]" do
    let(:input) {["ab","cb"]}
    it_behaves_like 'it returns', "b"
  end
  context "for [abc,def]" do
    let(:input) {["abc","def"]}
    it_behaves_like 'it returns', nil
  end
  xcontext "for [abc,aef]" do
    let(:input) {["abc","aef"]}
    it_behaves_like 'it returns', nil
  end
end
