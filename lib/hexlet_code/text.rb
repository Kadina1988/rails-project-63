# frozen_string_literal: true

module HexletCode
  class Text
    attr_reader :tag, :attrs, :content

    def initialize(content, attr, params)
      @tag = 'textarea'
      @content = content
      collecting_attrs(attr, params)
    end

    def collecting_attrs(name, params)
      @attrs = if params.key?(:rows) && params.key?(:cols)
                 { rows: params[:rows], cols: params[:cols], name: name.to_s }
               else
                 { name: name.to_s, rows: '50', cols: '50' }
               end
    end
  end
end
