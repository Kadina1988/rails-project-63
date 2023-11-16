install:
	bundle install

lint:
  make:
    rubocop

testing:
	ruby test/test_hexlet_code.rb


