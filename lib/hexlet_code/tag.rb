require 'erb'

module HexletCode::Tag
  def self.build(tag)
    template = "<#{tag}>"
    renderer = ERB.new(template)
    renderer.result(binding)
  end
end


