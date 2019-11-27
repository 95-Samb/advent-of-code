require_relative "../find_letters"

describe FindSimilarBoxIdLetters do
  x = FindSimilarBoxIdLetters.new
  shared_examples "it returns" do |parameter|
    it "#{parameter}" do
      expect(subject.send(input)).to eq(parameter)
    end
  end
  context "for []" do
    let(:input) {[]}
    it_behaves_like 'it returns', nil
  end
  context "for two inputs of length 2" do
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
  end
  context "for two inputs of length 3" do
    context "for [abc,def]" do
      let(:input) {["abc","def"]}
      it_behaves_like 'it returns', nil
    end
    context "for [abc,aef]" do
      let(:input) {["abc","aef"]}
      it_behaves_like 'it returns', nil
    end
    context "for [abc,abf]" do
      let(:input) {["abc","abf"]}
      it_behaves_like 'it returns', "ab"
    end
    context "for [aac,aaf]" do
      let(:input) {["aac","aaf"]}
      it_behaves_like 'it returns', "aa"
    end
    context "for [cba,abc]" do
      let(:input) {["cba","abc"]}
      it_behaves_like 'it returns', nil
    end
    context "for [aac,aca]" do
      let(:input) {["aac","aca"]}
      it_behaves_like 'it returns', nil
    end
    context "for [abcd,efgh]" do
      let(:input) {["abcd","efgh"]}
      it_behaves_like 'it returns', nil
    end
  end
  context "for [abcd,efcd]" do
    let(:input) {["abcd","efcd"]}
    it_behaves_like 'it returns', nil
  end
  context "for [afcd,efcd]" do
    let(:input) {["afcd","efcd"]}
    it_behaves_like 'it returns', "fcd"
  end
  context "for [afcdaaaa,efcdbbbb]" do
    let(:input) {["afcdaaaa","efcdbbbb"]}
    it_behaves_like 'it returns', nil
  end
  context "for [ab,ac,de]" do
    let(:input) {["ab","ac","de"]}
    it_behaves_like 'it returns', "a"
  end
  context "for [de,ac,ab]" do
    let(:input) {["de","ac","ab"]}
    it_behaves_like 'it returns', "a"
  end
  context "for same_letters method" do
    it "returns array of joint values" do
      expect(x.same_letters("ab","ac")).to eq("a")
    end
    it "returns array of joint values" do
      expect(x.same_letters("abcde","acdef")).to eq("a")
    end
    it "returns array of joint values" do
      expect(x.same_letters("aaabb","aaacc")).to eq("aaa")
    end
    it "returns array of joint values" do
      expect(x.same_letters("abcdefg","abefcdg")).to eq("abg")
    end
  end

end
