module HexletCode
  class TagBuilder
    def create_html_tag(tag, params)
      if params.empty?
        "<#{tag}>"
      else
        with_params(tag, params)
      end
    end

    private

    def with_params(tag, params)
      arr_tags = []
      arr_tags << tag
      arr_tags << params.map { |k, v| "#{k}='#{v}'" }.join(' ')
      tag_param = arr_tags.join(' ')
      "<#{tag_param}>"
    end
  end
end
