# frozen_string_literal: true

module HexletCode
  class Renderer
    attr_reader :args

    def initialize(obj, tags, parametres)
      @params_for_form = parametres
      @form = obj
      @args = tags
      @html = []
    end

    def render(_params = {})
      generate_form(@params_for_form) { generate_field }
    end

    private

    def generate_form(params, &block)
      HexletCode::Tag.build('form', params) { block.call }
    end

    def generate_field
      @args.each do |arg|
        @html << if arg.text.nil?
                   HexletCode::Tag.build(arg.tag, arg.attrs)
                 else
                   HexletCode::Tag.build(arg.tag, arg.attrs) { arg.text }
                 end
      end
      @html.join(' ')
    end
  end
end
