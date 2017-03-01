require './lib/validator'

describe Validator do
  context "upon being defined" do
    it "changes words to numbers" do
      expect(Validator::Validators.clean_text("one two three")).to eql("123")
      expect(Validator::Validators.clean_text("uno dos tres")).to eql("123")
    end
  end
end