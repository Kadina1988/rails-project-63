![CI](https://github.com/Kadina1988/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)

![CI](https://github.com/Kadina1988/rails-project-63/actions/workflows/https://github.com/Kadina1988/rails-project-63/actions/runs/6979910049)

Module HexletCode
==================

## HexletCode create html form

For example

create object

```
@object = User.new name: 'Bob', job: 'developer'>

```

With url:

```
<HexletCode.form_for @object, url: '/user' do |f|>
  <f.input :name>
<end>

 =>

<form action='/user' method='post'>
  <label for='name'>Name</label>
  <input name='name' type='text' value='Bob'>
</form>
```

Without url :

```
HexletCode.form_for @object do |f|
  f.input :name
end

=>

<form action='#' method='post'>
  <label for='name'>Name</label>
  <input name='name' type='text' value='Bob'>
</form>

```

There is option text


```
HexletCode.form_for @object do |f|
  f.input :job, as: :text
end

=>

<form action='#' method='post'>
  <textarea name='job' rows='20' cols='20'>developer</textarea>
</form>

```

create type Sumbit

```

HexletCode.form_for @object do |f|
  f.sumbit
end

=>

<form action='#' method='post'>
  <input type='Submit' value='name'>
</form>

```

Can add class :

```
  HexletCode.form_for @object do |f|
    f.input :name, class: 'input'  => <input name='name' type='text' value='Bob' class='input'>
  end

```






