# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  include TestHelpers

  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: 'Rob', job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_method_build_one_teg
    expect = '<br>'
    actual = HexletCode::Tag.build('br')

    assert_equal(expect, actual)
  end

  def test_method_build_few_teg
    expect = "<img src='path/to/image'>"
    actual = HexletCode::Tag.build('img', src: 'path/to/image')

    assert_equal(expect, actual)
  end

  def test_form_for_with_additional_parametres
    expect = get_fixtures('label_input')
    expect.chomp!

    actual = HexletCode.form_for @user do |f|
      f.input :name
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_class
    expect = get_fixtures('input_with_class')
    expect.chomp!

    actual = HexletCode.form_for @user, url: '/user' do |f|
      f.input :name, class: 'input'
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_defolt_value
    expect = get_fixtures('textarea')
    expect.chomp!

    actual = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_user_value
    expect = get_fixtures('textarea_with_params')
    expect.chomp!

    actual = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 55, cols: 55
    end

    assert_equal(expect, actual)
  end

  def test_form_for_two_attr
    expect = "<form action='/user' method='post'><input type='submit' value='wow'></form>"

    actual = HexletCode.form_for @user, url: '/user' do |f|
      f.submit 'wow'
    end

    assert_equal(expect, actual)
  end

  def test_default_submit
    expect = "<form action='#' method='post'><input type='submit' value='Save'></form>"

    actual = HexletCode.form_for @user, &:submit

    assert_equal(expect, actual)
  end

  def test_with_tag_form
    expect = "<form action='/profile' method='get' class='hexlet-class'><input type='submit' value='Save'></form>"

    actual = HexletCode.form_for @user, url: '/profile', method: 'get', class: 'hexlet-class', &:submit

    assert_equal(expect, actual)
  end
end
