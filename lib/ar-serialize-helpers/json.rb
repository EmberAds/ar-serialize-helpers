# assumes JSON is loaded when this is used
module ARSerializeHelpers
  class JSON
    def dump obj
      obj.to_json if obj != nil
    end

    def load text
      ::JSON.parse(text) if text
    end
  end
end
