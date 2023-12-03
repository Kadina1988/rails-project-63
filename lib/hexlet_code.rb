# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, File.join(File.dirname(FILE), './lib/hexlet_code/tag'))
  autoload(:Form, File.join(File.dirname(FILE), './lib/hexlet_code/form'))
  autoload(:Renderer, File.join(File.dirname(FILE), './lib/hexlet_code/renderer'))

  def self.form_for(obj, params = {})
    form = Form.new(obj)

    yield form

    Renderer.new(form, form.fields).render(params)
  end

  class Error < StandardError; end
end
