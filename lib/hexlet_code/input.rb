# frozen_string_literal: true

module HexletCode
  class Input
    attr_reader :tag, :attrs, :content

    def initialize(attrs, params = {})
      @tag = 'input'
      @attrs = attrs
      @attrs.merge!(params)
      @content = nil
    end
  end
end
