require './program'

describe Program do
  before(:all) do
    @program = Program.new

    @valid_str   = "Hello, I'm a valid string"
    @invalid_str = "Hello, I'm an invalid string, at uno uno dos 3 3 4 cinco seis"
  end

  context "on a regular instance of a client class" do
    it "includes an instance of the validator class" do
      expect(@program).to be_an_instance_of(Program)
      expect(@program).to respond_to(:validate_text)
    end

    it "accepts a valid string" do
      expect(@program.validate_text(@valid_str)).to be(true)
    end

    it "rejects an invalid string" do
      expect(@program.validate_text(@invalid_str)).to be(false)
    end

    it "rejects an email" do
      expect(@program.validate_text("Hola, de timmy@hotmail.com hahaha")).to be(false)
    end
  end
end