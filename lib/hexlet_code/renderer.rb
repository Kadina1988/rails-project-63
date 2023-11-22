# frozen_string_literal: true

module HexletCode
  class Renderer
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
      if params.empty?
        HexletCode::Tag.build('form', action: '#', method: 'post') { block.call }
      else
        HexletCode::Tag.build('form', action: params[:url], method: 'post') { block.call }
      end
    end

    def generate_field
      @args.each do |arg|
        if arg[0] == 'textarea'
          @html << HexletCode::Tag.build(arg[0], arg[1]) { @form.obj.public_send(arg[2]) }
        elsif arg[1][:type] == 'submit'
          @html << HexletCode::Tag.build(arg[0], arg[1])
        else
          @html << HexletCode::Tag.build('label', for: arg[2]) { arg[2].to_s.capitalize }
          @html << HexletCode::Tag.build(arg[0], arg[1])
        end
      end
      @html.join(' ') #
    end
  end
end
