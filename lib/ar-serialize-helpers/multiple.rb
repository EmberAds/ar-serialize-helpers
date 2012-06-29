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
      serializers.reverse.reduce(obj) { |obj, serializer| serializer.load obj }
    end
  end
end
