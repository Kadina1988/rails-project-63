# frozen_string_literal: true

require_relative 'form/input'
require_relative 'form/text'
require_relative 'form/label'

module HexletCode
  class Form
    attr_reader :fields, :obj, :form_params

    def initialize(obj, params = {})
      @form_params = set_params(params)
      @obj = obj
      @fields = []
    end

    def input(attr, params = {})
      @fields << HexletCode::Form::Label.new(attr, @obj.public_send(attr))
      @fields << Object.const_get("HexletCode::Form::#{(params[:as] || 'input').capitalize}").new(@obj.public_send(attr),
                                                                                                  attr,
                                                                                                  params)
    end

    def submit(name = 'Save')
      @fields << HexletCode::Form::Input.new(name, nil, type: 'submit')
    end

    private

    def set_params(params = {})
      default_params = { action: '#', method: 'post' }

      default_params[:action] = params[:url] if params.key?(:url)
      params.delete(:url)

      default_params.merge!(params)
    end
  end
end
