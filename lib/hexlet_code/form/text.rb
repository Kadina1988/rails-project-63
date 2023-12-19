# frozen_string_literal: true

module HexletCode
  class Form
    class Text
      attr_reader :tag, :attrs, :text

      def initialize(text, attr, params)
        @tag = 'textarea'
        @text = text

        @attrs = collecting_attrs(attr, params)
      end

      private

      def collecting_attrs(name, params)
        { rows: params[:rows] || 50, cols: params[:cols] || 50, name: name.to_s }
      end
    end
  end
end
