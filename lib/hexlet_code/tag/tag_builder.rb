# frozen_string_literal: true

module HexletCode
  module Tag
    class TagBuilder
      def create_html_tag(tag, params = {})
        "<#{tag}" + " #{with_params(params)}>"
      end

      private

      def with_params(params)
        params.map { |k, v| "#{k}='#{v}'" }.join(' ')
      end
    end
  end
end
