# frozen_string_literal: true

module HexletCode
  class Form
    class Input
      attr_reader :tag, :attrs, :text

      def initialize(value, attr, params = {})
        @tag = 'input'
        @attrs = {}
        @attrs[:name] = attr unless attr.nil?
        @attrs[:type] = 'text' || params[:type]
        @attrs[:value] = value
        add_attrs(params)
      end

      private

      def add_attrs(params)
        @attrs.merge!(params)
      end
    end
  end
end
