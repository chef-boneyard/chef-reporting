PACKAGE=chef-reporting

build:
	gem build $(PACKAGE).gemspec

clean:
	@rm $(PACKAGE)-*.gem
