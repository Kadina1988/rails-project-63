# frozen_string_literal: true

module HexletCode
  class Form
    class Label
      attr_reader :tag, :attrs, :text

      def initialize(attr, _text)
        @tag = 'label'
        @text = attr.to_s.capitalize
        @attrs = { for: attr.to_s }
      end
    end
  end
end
