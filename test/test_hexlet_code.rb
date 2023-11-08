# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, keyword_init: true)

  def setup
    @user = User.new name:'Rob'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  # def test_method_build_one_teg
  #   expect = '<br>'
  #   actual = HexletCode::Tag.build('br')

  #   assert_equal(expect, actual)
  # end

  # def test_method_build_few_teg
  #   expect = "<img src='path/to/image'>"
  #   actual = HexletCode::Tag.build('img', src: 'path/to/image')

  #   assert_equal(expect, actual)
  # end

  def test_method_build_with_block
    expect = "<label for='email'>Email</label>"
    actual = HexletCode::Tag.build('label', for: 'email') { 'Email' }

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

    actual = HexletCode.form_for @user, url: '/user' do |f|
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_additional_parametres
    user = User.new name: 'rob'

    expect =  "<form action='#' method='post'><input name='name' type='text' value='rob'></form>"

    actual = HexletCode.form_for user, url: '#' do |f|
      f.input :name
    end

    assert_equal(expect, actual)
  end

  # def test_form_for_with_defolt_value
  #   expect = "<form action='#' method='post'>
  #              <textarea name='job' cols='20' rows='40'>hexlet</textarea>
  #            </form>"

  #   actual = HexletCode.form_for @user do |f|
  #              f.input :job, as: :text
  #   end

  #   assert_equal(expect, actual)
  # end
end
