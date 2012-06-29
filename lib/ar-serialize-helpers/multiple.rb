module ARSerializeHelpers
  class Multiple
    attr_accessor :serializers

    # First defined is first to run when dumping. Last to run when loading.
    def initialize *serializers
      self.serializers = serializers
    end

    def dump obj
      serializers.reduce(obj) { |obj, serializer| serializer.dump obj }
    end

    def load obj
      serializers.reverse.reduce(obj) do |obj, serializer|
        begin
          serializer.load obj
        rescue => e
          # If we can't load for some reason, just carry on with original value
          next(obj)
        end
      end
    end
  end
end
