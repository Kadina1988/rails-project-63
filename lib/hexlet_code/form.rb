module HexletCode
  class Form
    attr_reader :obj, :fields

    def initialize(obj)
      @obj = obj
      @fields = []
    end

    def input(attr)
      @fields << attr unless @fields.include?(attr)
      @obj.public_send(attr)
    end
  end
end
