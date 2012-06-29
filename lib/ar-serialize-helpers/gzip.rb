require "active_support/gzip"

# assumes gzip is loaded when this is used
module ARSerializeHelpers
  class Gzip
    def dump obj
      if obj.is_a?(String)
        ActiveSupport::Gzip.compress(obj) if obj != nil
      else
        obj
      end
    end

    def load text
      ActiveSupport::Gzip.decompress(text) if text
    end
  end
end
