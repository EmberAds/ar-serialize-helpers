require "spec_helper"
require "ar-serialize-helpers/json"
require "ar-serialize-helpers/gzip"
require "ar-serialize-helpers/multiple"

describe ARSerializeHelpers::Multiple do
  before do
    @s1, @s2 = ARSerializeHelpers::JSON.new, ARSerializeHelpers::Gzip.new
    @ms = ARSerializeHelpers::Multiple.new(@s1, @s2)
  end

  describe "#initialize" do
    it "should store the serializers passed in, in the right order" do
      @ms.serializers.should be == [@s1, @s2]
    end
  end

  describe "#dump" do
    it "should run through the serializers in order given" do
      @s1.should_receive(:dump).with("my string").and_return(%{"json"})
      @s2.should_receive(:dump).with(%{"json"}).and_return("gzip")
      @ms.dump("my string").should be == "gzip"
    end
    it "should work with json & gzip properly" do
      @result = @ms.dump({"my" => "hash"})
      @result = ActiveSupport::Gzip.decompress(@result)
      @result.should be == %({"my":"hash"})
      JSON.parse(@result).should be == {"my" => "hash"}
    end
  end

  describe "#load" do
    it "should run through the serializers in reverse order" do
      @s2.should_receive(:load).with("gzip").and_return(%{"json"})
      @s1.should_receive(:load).with(%{"json"}).and_return("my string")
      @ms.load("gzip").should be == "my string"
    end
    it "should work with json & gzip correctly" do
      @input = {"my" => "hash"}
      @input = JSON.dump(@input)
      @input = ActiveSupport::Gzip.compress(@input)
      @result = @ms.load(@input)
      @result.should be == {"my" => "hash"}
    end
  end
end
