# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :fields, :obj

    def initialize(obj)
      @obj = obj
      @fields = []
    end

    def input(attr, params = {})
      attributes = []

      if params[:as] == :text
        tag = 'textarea'
        param = create_params_for_text(attr, params)
      else
        tag = 'input'
        param = create_params_for_input(attr, params)
      end

      attributes << tag << param << attr
      @fields << attributes
    end

    def submit(name = 'Save')
      tag = 'input'
      attr = []
      attr << tag << { type: 'submit', value: name }
      @fields << attr
    end

    private

    def create_params_for_input(attr, params)
      value = @obj.public_send(attr)

      if params.key?(:class)
        { name: attr.to_s, type: 'text', value: value, class: params[:class] }
      else
        { name: attr.to_s, type: 'text', value: value }
      end
    end

    def create_params_for_text(attr, params)
      name_attr = attr.to_s

      if params.key?(:rows) && params.key?(:cols)
        { rows: params[:rows], cols: params[:cols], name: name_attr }
      else
        { name: name_attr, rows: 20, cols: 20 }
      end
    end
  end
end
