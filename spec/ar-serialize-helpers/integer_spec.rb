require "spec_helper"
require "ar-serialize-helpers/integer"

describe ARSerializeHelpers::Integer do
  before { @ints = ARSerializeHelpers::Integer.new }

  describe "#dump" do
    it "should dump integer successfully" do
      @ints.dump(5).should be == 500
    end
    it "should dump float successfully" do
      @ints.dump(0.58).should be == 58
    end
    it "should dump string successfully" do
      @ints.dump("0.58").should be == 58
    end
    it "should not dump nil" do
      @ints.dump(nil).should be_nil
    end
  end

  describe "#load" do
    it "should load integer successfully" do
      @ints.load(58).should be == 0.58
    end
    it "should parse nil to nil" do
      @ints.load(nil).should be_nil
    end
  end

end
