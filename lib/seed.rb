require_relative 'hexlet_code'
require_relative 'hexlet_code/renderer'
require_relative 'hexlet_code/form'
require_relative 'hexlet_code/renderer'

class Seed
  User = Struct.new(:name, :job, keyword_init:true)
  attr_reader :user, :form, :rend

  def initialize
    @user = User.new name: 'Rob', job: 'Hexlet'
    @form = HexletCode::Form.new(@user)
    @rend = HexletCode::Renderer.new(@form, @form.fields)
  end

  def hex
    HexletCode.form_for @user, url: '/jks' do |f|
      f.input :name
      f.input :job
    end
  end

end


