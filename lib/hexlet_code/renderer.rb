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
      HexletCode::Tag.build('form', action: params[:url] || params[:action] || '#', method: params[:method] || 'post') { block.call }
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
