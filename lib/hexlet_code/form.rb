# frozen_string_literal: true

require_relative 'form/input'
require_relative 'form/text'
require_relative 'form/label'

module HexletCode
  class Form
    attr_reader :fields, :obj, :form_params

    def initialize(obj, params = {})
      @form_params = generate_form_params(params)
      @obj = obj
      @fields = []
    end

    def input(attr, params = {})
      @fields << HexletCode::Form::Label.new(attr, @obj.public_send(attr))

      @fields << if params.key?(:as) && (params[:as] = :text)
                   HexletCode::Form::Text.new(@obj.public_send(attr), attr, params)
                 else
                   HexletCode::Form::Input.new({ name: attr.to_s, type: 'text', value: @obj.public_send(attr) },
                                               params)
                 end
    end

    def submit(name = 'Save')
      @fields << HexletCode::Form::Input.new(type: 'submit', value: name)
    end

    private

    def generate_form_params(params)
      if params.key?(:class)
        { action: params[:url] || '#', method: params[:method] || 'post', class: params[:class] }
      else
        { action: params[:url] || '#', method: params[:method] || 'post' }
      end
    end
  end
end
