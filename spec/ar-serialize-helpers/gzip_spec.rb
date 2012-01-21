require "spec_helper"
require "gzip"
require "ar-serialize-helpers/gzip"

module GzipSpecHelpers
  extend self

  # helperz
  def long_text
    "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Cras mattis consectetur purus sit amet fermentum. Nullam quis risus eget urna mollis ornare vel eu leo. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Etiam porta sem malesuada magna mollis euismod."
  end
end

describe ARSerializeHelpers::Gzip do
  before { @gz = ARSerializeHelpers::Gzip.new }

  describe "#dump" do
    it "should dump a large bit of text successfully" do
      @gz.dump(GzipSpecHelpers.long_text).gunzip.should be == GzipSpecHelpers.long_text
    end
    it "should not dump nil" do
      @gz.dump(nil).should be_nil
    end
    it "should not dump an integer" do
      @gz.dump(10).should be == 10
    end
  end

  describe "#load" do
    it "should load integer successfully" do
      @gz.load(GzipSpecHelpers.long_text.gzip).should be == GzipSpecHelpers.long_text
    end
    it "should parse nil to nil" do
      @gz.load(nil).should be_nil
    end
  end

end
