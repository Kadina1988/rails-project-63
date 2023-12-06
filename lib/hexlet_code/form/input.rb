# frozen_string_literal: true

module HexletCode
  class Form
    class Input
      attr_reader :tag, :attrs, :text

      def initialize(attrs, params = {})
        @tag = 'input'
        @attrs = attrs.merge!(params)
        @content = nil
      end
    end
  end
end
