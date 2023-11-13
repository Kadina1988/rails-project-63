require_relative 'args_creator'

module HexletCode
  class Form
    attr_reader :fields, :obj

    def initialize(obj)
      @obj = obj
      @fields = []
    end

    def input(attr, params = { as: :input, rows: 20, cols: 20 })
      tag_params = HexletCode::ArgsCreator.new(attr, params).create_args

      @fields << tag_params unless @fields.include?(tag_params)
    end
  end
end
