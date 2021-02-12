require_relative "../customs_form"

describe CustomsForm do
  context "for any yes answers" do
    it "returns 1 for a" do
      expect(CustomsForm.new.any_yes_answers("a")).to eq(1)
    end
    it "returns 0 for blank" do
      expect(CustomsForm.new.any_yes_answers("")).to eq(0)
    end
    it "returns 1 for aa" do
      expect(CustomsForm.new.any_yes_answers("aa")).to eq(1)
    end
    it "returns 5 for aabbccddee" do
      expect(CustomsForm.new.any_yes_answers("aabbccddee")).to eq(5)
    end
    it "returns 5 for aa\nbb\ncc\ndd\nee" do
      expect(CustomsForm.new.any_yes_answers("aa\nbb\ncc\ndd\nee")).to eq(5)
    end
  end
  context "for shared yes answers" do
    it "returns 1 for a" do
      expect(CustomsForm.new.shared_yes_answers("a")).to eq(1)
    end
    it "returns 0 for a\nb" do
      expect(CustomsForm.new.shared_yes_answers("a\nb")).to eq(0)
    end
    it "returns 1 for ab\nbc" do
      expect(CustomsForm.new.shared_yes_answers("ab\nbc")).to eq(1)
    end
    it "returns 2 for abc\nace\nacd" do
      expect(CustomsForm.new.shared_yes_answers("abc\nace\nacd")).to eq(2)
    end
    it "returns 1 for r\nr\nr\nr\nr" do
      expect(CustomsForm.new.shared_yes_answers("r\nr\nr\nr\nr")).to eq(1)
    end
  end
end
