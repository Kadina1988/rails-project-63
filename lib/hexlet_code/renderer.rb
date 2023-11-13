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
        generate_input(arg[1], arg) if arg[1] == 'input'

        generate_textarea(arg[1], arg) if arg[1] == 'textarea'
      end
      @html.join(' ')
    end

    def generate_input(tag, param)
      if param[2].any? && param[2].has_key?(:class)
        @html << HexletCode::Tag.build(tag, name: "#{param[0]}", type: 'text',
                                            value: "#{@form.obj.public_send(param[0])}", class: "#{param[2][:class]}")
      else
        @html << HexletCode::Tag.build(tag, name: "#{param[0]}", type: 'text',
                                            value: "#{@form.obj.public_send(param[0])}")
      end
    end

    def generate_textarea(tag, param)
      default_rows = 20
      default_cols = 20

      rows =  if param[2].any? && param[2].has_key?(:rows)
                param[2][:rows]
              else
                default_rows
              end

      cols =  if param[2].any? && param[2].has_key?(:cols)
                param[2][:cols]
              else
                default_cols
              end

      @html << HexletCode::Tag.build(tag, rows: "#{rows}", cols: "#{cols}", name: "#{param[0]}") do
        "#{@form.obj.public_send(param[0])}"
      end
    end
  end
end
