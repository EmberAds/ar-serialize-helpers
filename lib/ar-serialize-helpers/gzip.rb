# assumes gzip is loaded when this is used
module ARSerializeHelpers
  class Gzip
    def dump obj
      if obj.is_a?(String)
        obj.gzip if obj != nil
      else
        obj
      end
    end

    def load text
      text.gunzip if text
    end
  end
end
