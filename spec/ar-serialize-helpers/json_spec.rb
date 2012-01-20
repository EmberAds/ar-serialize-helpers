require "spec_helper"
require "json"
require "ar-serialize-helpers/json"

module JSONSpecHelpers
  extend self

  # helperz
  def ruby_to_json
    {
      true => "true",
      1 => "1",
      1.0 => "1.0",
      "string" => %{"string"},
      :symbol => %{"symbol"},
      {"foo" => "bar"} => %@{"foo":"bar"}@,
      [1,2,3] => "[1,2,3]"
    }
  end

  def json_to_ruby
    ruby_to_json.reject {|k,v| k == :symbol }.invert
  end
end

describe ARSerializeHelpers::JSON do
  before { @js = ARSerializeHelpers::JSON.new }

  describe "#dump" do
    JSONSpecHelpers.ruby_to_json.each do |ruby, json_str|
      it "should dump #{ruby.class} to json successfully" do
        @js.dump(ruby).should be == json_str
      end
    end
    it "should not dump nil" do
      @js.dump(nil).should be_nil # rather than "null" - JSON.parse("null") will throw an error y'see
    end
  end

  describe "#load" do
    JSONSpecHelpers.json_to_ruby.each do |json_str, ruby|
      it "should load #{ruby.class} from json successfully" do
        # Have to wrap in an array so JSON can parse the primitive types
        @js.load("[#{json_str}]").should == [ruby]
      end
    end
    it "should parse nil to nil" do
      @js.load(nil).should be_nil
    end
  end

end
