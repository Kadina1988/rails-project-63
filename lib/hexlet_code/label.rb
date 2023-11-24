# frozen_string_literal: true

module HexletCode
  class Label
    attr_reader :tag, :attrs, :content

    def initialize(attr, _content)
      @tag = 'label'
      @content = attr.to_s.capitalize
      @attrs = { for: attr.to_s}
    end
  end
end
