require 'erb'

module HexletCode::Tag
  def self.build(*tag)
    string = tag.join(' ')
    arr = string.chars
    arr.delete_if { |c| c.start_with?('{', '}', ':', '>', ',') }
    res = arr.join

    template = "<#{res}>"
    renderer = ERB.new(template)
    renderer.result(binding)
  end
end
