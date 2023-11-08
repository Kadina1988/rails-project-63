require_relative 'tag_builder'

module HexletCode::Tag
  def self.build(tag, params = {}, &block)
    if block_given?
      "#{HexletCode::TagBuilder.new.create_html_tag(tag, params)}#{block.call}</#{tag}>"
    else
      "#{HexletCode::TagBuilder.new.create_html_tag(tag, params)}"
    end
  end
end
