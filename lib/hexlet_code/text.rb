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
      @attrs = { rows: params[:rows] || 50, cols: params[:cols] || 50, name: name.to_s }
    end
  end
end
