# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, keyword_init: true)

  def setup
    @user = User.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_does_something_useful
    assert true
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
    user = User.new name: 'Rob'

    expect = "<form action='#' method='post'
               input name='name' type='text' value='rob' class='user-input'
               input name='job' type='text' value='hexlet'>
             </form>"

    actual = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
    end

    assert_equal(expect, actual)
  end

  def test_form_for_with_defolt_value
    expect = "<form action='#' method='post'>
               <textarea name='job' cols='20' rows='40'>hexlet</textarea>
             </form>"

    actual = HexletCode.form_for @user do |f|
               f.input :job, as: :text
    end

    assert_equal(expect, actual)
  end
end
