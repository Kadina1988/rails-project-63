![CI](https://github.com/Kadina1988/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)

![CI](https://github.com/Kadina1988/rails-project-63/actions/workflows/main.yml/badge.svg)

Modlule HexletCode
==================

## HecletCode create html form

For expample

<@object = User.new name: 'Bob', job: 'developer'>

with url

<HexletCode.form_for @user, url: '/user' do |f|>
  <f.input :name>
<end>

<form action='/user' method='post'>
  <label for='name'>Name</label>
  <input name='name' type='text' value='Bob'>
</form>
--------------------------------------------------
without url :

    HexletCode.form_for @user do |f|
      f.input :name
    end =>

   <form action='#' method='post'>
     <label for='name'>Name</label>
     <label for='a'>A</label>
   </form>

There is option as: :text, create tag <textarea>

   HexletCode.form_for @user do |f|
      f.input :name, as: :text
    end =>

      <form action='#' method='post'>
        <textarea name='name' rows='20' cols='20'>Bob</textarea>
      </form>

create type Sumbit

  HexletCode.form_for do |f|
    f.sumbit
  end =>

  <form action='#' method='post'>
    <input type='Submit' value='name'>
  </form>

Can add class :
  HexletCode.form_for @user do |f|
    f.input :name, class: 'input'  => <input name='name' type='text' value='Bob' class='input'>
  end =>






