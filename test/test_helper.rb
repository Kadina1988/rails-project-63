# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

module TestHelpers
  def get_fixtures(name)
    File.read("test/fixtures/#{name}.html")
  end
end
