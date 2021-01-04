require_relative "../password_validater"

describe PasswordValidater do
  it "returns nil for [1-1 a: b]" do
    expect(PasswordValidater.new.execute(["1-1 a: b"])).to eq(nil)
  end
  it "returns 1 for [1-1 a: a]" do
    expect(PasswordValidater.new.execute(["1-1 a: a"])).to eq(1)
  end
  it "returns 1 for [1-1 b: b]" do
    expect(PasswordValidater.new.execute(["1-1 b: b"])).to eq(1)
  end
  it "returns 1 for [1-1 b: ab]" do
    expect(PasswordValidater.new.execute(["1-1 b: ab"])).to eq(1)
  end
  it "returns 1 for [1-1 b: abcdefghjk]" do
    expect(PasswordValidater.new.execute(["1-1 b: abcdefghjk"])).to eq(1)
  end
  xit "returns 1 for [1-1 b: bb]" do
    expect(PasswordValidater.new.execute(["1-1 b: bb"])).to eq(nil)
  end

  context "for password formatter method" do
    it "returns [1,1,a,a] for 1-1 a: a" do
      expect(PasswordValidater.new.password_formatter("1-1 a: a")).to eq(["1","1","a","a"])
    end
    it "returns [1,2,a,abcdef] for 1-2 a: abcdef" do
      expect(PasswordValidater.new.password_formatter("1-2 a: abcdef")).to eq(["1","2","a","abcdef"])
    end
  end
  context "for password validater method" do
    it "returns true for [1,1,a,a] " do
      expect(PasswordValidater.new.password_validater(["1","1","a","a"])).to eq(true)
    end
    it "returns nil for [1,1,a,b] " do
      expect(PasswordValidater.new.password_validater(["1","1","a","b"])).to eq(nil)
    end
    it "returns true for [1,1,a,ba] " do
      expect(PasswordValidater.new.password_validater(["1","1","a","ba"])).to eq(true)
    end
    it "returns true for [1,7,a,ba] " do
      expect(PasswordValidater.new.password_validater(["1","7","a","ba"])).to eq(true)
    end
    it "returns nil for [2,2,a,ba] " do
      expect(PasswordValidater.new.password_validater(["2","2","a","ba"])).to eq(nil)
    end
    it "returns true for [2,2,a,baa] " do
      expect(PasswordValidater.new.password_validater(["2","2","a","baa"])).to eq(true)
    end
    it "returns true for [2,5,a,baaaa] " do
      expect(PasswordValidater.new.password_validater(["2","5","a","baaaa"])).to eq(true)
    end
    it "returns false for [2,5,a,baaaaaa] " do
      expect(PasswordValidater.new.password_validater(["2","5","a","baaaaaa"])).to eq(nil)
    end
  end
end
