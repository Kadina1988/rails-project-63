module HexletCode
  class Renderer
    attr_accessor :tags, :html

    def initialize(obj, tags)
      @obj = obj
      @tags = tags
    end

    def render(params = {})
      generate_form(params) {generate_field}
    end

    # private

    def generate_form(params={}, &block)
      if params.empty?
        HexletCode::Tag.build('form', action: '#', method: 'post') {block.call}
      else
        HexletCode::Tag.build('form', action: params[:url], method: 'post') {block.call}
      end
    end

    def generate_field(params = {})
      @html = []
      @tags.each do |tag|
        @html << HexletCode::Tag.build('input', name: "#{tag}", type: 'text', value: "#{@obj.input(tag)}")
      end
      @html.join(' ')
    end
  end
end

# HexletCode::Tag.build('input', name: "#{tag}", type: 'text', value: "#{@obj.input(tag)}")
