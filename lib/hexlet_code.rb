# frozen_string_literal: true

require 'erb'
require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, './lib/hexlet_code/tag')
  autoload(:Form, './lib/hexlet_code/form')
  autoload(:Renderer, './lib/hexlet_code/renderer')

  def self.form_for(obj, params = {})
    form = Form.new(obj)

    yield form

    Renderer.new(form, form.fields).render(params)
  end

  class Error < StandardError; end
  # Your code goes here...
end
