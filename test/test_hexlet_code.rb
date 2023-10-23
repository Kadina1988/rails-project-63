# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name)
  USER = User.new(name: 'rob')

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_form_for_without_path
    expect = "<form action='#' method='post'></form>"

    actual = HexletCode.form_for USER do |f|
    end
    assert_equal(expect, actual)
  end

  def test_form_for_with_path
    expect = "<form action='/user' method='post'></form>"

    actual = HexletCode.form_for USER, url: '/user' do |f|
    end

    assert_equal(expect, actual)
  end
end
