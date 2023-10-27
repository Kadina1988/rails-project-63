# frozen_string_literal: true

require 'erb'
require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, './lib/hexlet_code/tag')

  def self.form_for(obj, path = nil)
    yield obj

    template =  if path.nil?
                 "<form action='#' method='post'></form>"
                else
                 "<form action='#{path[:url]}' method='post'></form>"
                end

    renderer = ERB.new(template)
    renderer.result(binding)
  end



  class Error < StandardError; end
  # Your code goes here...
end


class A
  def self.my_method(attribute)
    define_method attribute do
      self.instance_variable_get "@#{attribute}"
    end
  end

  my_method :name

  def initialize(name)
    @name = name
  end
end

