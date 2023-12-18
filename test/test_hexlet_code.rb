# frozen_string_literal: true

require_relative 'test_helper'
require 'active_support/all'

class TestHexletCode < Minitest::Test
  include TestHelpers

  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: 'Rob', job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_method_build_few_teg
    expect = "<img src='path/to/image'>"
    actual = HexletCode::Tag.build('img', src: 'path/to/image')

    assert_equal(expect, actual)
  end

  def test_form_for_with_additional_parametres
    expect = get_fixtures('form_for_with_additional_parametres')
    expect.chomp!

    actual = HexletCode.form_for @user do |f|
      f.input :name
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_class
    expect = get_fixtures('form_for_with_class')
    expect.chomp!

    actual = HexletCode.form_for @user, url: '/user' do |f|
      f.input :name, class: 'input'
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_default_value
    expect = get_fixtures('form_for_with_default_value')
    expect.chomp!

    actual = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_user_value
    expect = get_fixtures('form_for_with_user_value')
    expect.chomp!

    actual = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 55, cols: 55
    end

    assert_equal(expect, actual)
  end

  def test_form_for_two_attr
    expect = get_fixtures('form_for_two_attr')
    expect.chomp!

    actual = HexletCode.form_for @user, url: '/user' do |f|
      f.submit 'wow'
    end

    assert_equal(expect, actual)
  end

  def test_default_submit
    expect = get_fixtures('default_submit')
    expect.chomp!

    actual = HexletCode.form_for @user, &:submit

    assert_equal(expect, actual)
  end

  def test_with_tag_form
    expect = get_fixtures('with_tag_form')
    expect.chomp!

    actual = HexletCode.form_for @user, url: '/profile', method: 'get', class: 'hexlet-class', &:submit

    assert_equal(expect, actual)
  end
end
