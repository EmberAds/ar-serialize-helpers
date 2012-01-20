module ARSerializeHelpers
  class Integer
    def dump float
      (float.to_f * 100.0).round if float != nil
    end

    def load int
      int / 100.0 if int
    end
  end
end
