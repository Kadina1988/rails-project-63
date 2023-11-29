# frozen_string_literal: true

module HexletCode
  class Renderer
    attr_reader :args

    def initialize(obj, tags)
      @form = obj
      @args = tags
      @html = []
    end

    def render(params = {})
      generate_form(params) { generate_field }
    end

    private

    def generate_form(params = {}, &block)
      HexletCode::Tag.build('form', form_params(params)) { block.call }
    end

    def form_params(params)
      if params.key?(:class)
        { action: params[:action] || '#', method: params[:method] || 'post', class: params[:class] }
      else
        { action: params[:action] || '#', method: params[:method] || 'post' }
      end
    end

    def generate_field
      @args.each do |arg|
        @html << if arg.content.nil?
                   HexletCode::Tag.build(arg.tag, arg.attrs)
                 else
                   HexletCode::Tag.build(arg.tag, arg.attrs) { arg.content }
                 end
      end
      @html.join(' ')
    end
  end
end
