# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
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

  def test_form_for_without_path
    expect = "<form action='#' method='post'></form>"

    actual = HexletCode.form_for @user do |f|
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_path
    expect = "<form action='/user' method='post'></form>"

    actual = HexletCode.form_for @user, action: '/user' do |f|
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_additional_parametres
    expect = "<form action='#' method='post'><label for='name'>Name</label> <input name='name' type='text' value='Rob'></form>"

    actual = HexletCode.form_for @user do |f|
      f.input :name
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_class
    expect = "<form action='#' method='post'><label for='name'>Name</label> <input name='name' type='text' value='Rob' class='input'></form>"

    actual = HexletCode.form_for @user do |f|
      f.input :name, class: 'input'
    end
    assert_equal(expect, actual)
  end

  def test_form_for_with_defolt_value
    expect = "<form action='#' method='post'><label for='job'>Job</label> <textarea rows='50' cols='50' name='job'>hexlet</textarea></form>"

    actual = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_user_value
    expect = "<form action='#' method='post'><label for='job'>Job</label> <textarea rows='55' cols='55' name='job'>hexlet</textarea></form>"

    actual = HexletCode.form_for @user do |f|
      f.input :job, as: :text, rows: 55, cols: 55
    end

    assert_equal(expect, actual)
  end

  def test_form_for_two_attr
    expect = "<form action='/user' method='post'><input type='submit' value='wow'></form>"

    actual = HexletCode.form_for @user, action: '/user' do |f|
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

    actual = HexletCode.form_for @user, action: '/profile', method: 'get', class: 'hexlet-class', &:submit

    assert_equal(expect, actual)
  end
end
