require "spec_helper"
require "ar-serialize-helpers/gzip"

describe ARSerializeHelpers::Gzip do
  before { @gz = ARSerializeHelpers::Gzip.new }

  def long_text
    "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Etiam porta sem malesuada magna mollis euismod."
  end

  describe "#dump" do
    it "should dump a large bit of text successfully" do
      result = @gz.dump(long_text)
      ActiveSupport::Gzip.decompress(result).should be == long_text
    end
    it "should not dump nil" do
      @gz.dump(nil).should be_nil
    end
    it "should not dump an integer" do
      @gz.dump(10).should be == 10
    end
  end

  describe "#load" do
    it "should load a string successfully" do
      input = ActiveSupport::Gzip.compress(long_text)
      @gz.load(input).should be == long_text
    end
    it "should parse nil to nil" do
      @gz.load(nil).should be_nil
    end
  end

end
