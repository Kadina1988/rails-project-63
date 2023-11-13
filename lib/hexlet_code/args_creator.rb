module HexletCode
  class ArgsCreator
    def initialize(name_attr, attributes)
      @name_attr = name_attr
      @attributes = attributes
    end

    def create_args
      arr_params = []
      arr_params << @name_attr << create_tag << create_hash_params
    end

    private

    def create_tag
      tag = nil
      if @attributes[:as] == :text
        'textarea'
      else
        'input'
      end
    end

    def create_hash_params
      @attributes.delete(:as) if @attributes.has_key?(:as)
      @attributes
    end
  end
end
