# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, File.join(File.dirname(__FILE__), '/hexlet_code/tag.rb'))
  autoload(:Form, File.join(File.dirname(__FILE__), '/hexlet_code/form.rb'))
  autoload(:Renderer, File.join(File.dirname(__FILE__), '/hexlet_code/renderer.rb'))

  def self.form_for(obj, params = {})
    form = Form.new(obj)

    yield form

    Renderer.new(form, form.fields).render(params)
  end

  class Error < StandardError; end
end
