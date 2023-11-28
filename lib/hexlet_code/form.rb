# frozen_string_literal: true

require_relative 'input'
require_relative 'text'
require_relative 'label'

module HexletCode
  class Form
    attr_reader :fields, :obj

    def initialize(obj)
      @obj = obj
      @fields = []
    end

    def input(attr, params = {})
      @fields << HexletCode::Label.new(attr, @obj.public_send(attr))

      @fields << if params.key?(:as) && (params[:as] = :text)
                   HexletCode::Text.new(@obj.public_send(attr), attr, params)
                 else
                   HexletCode::Input.new({ name: attr.to_s, type: 'text', value: @obj.public_send(attr) },
                                         params)
                 end
    end

    def submit(name = 'Save')
      @fields << HexletCode::Input.new(type: 'submit', value: name)
    end
  end
end
