lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chef_reporting/version'

Gem::Specification.new do |gem|
  gem.name = 'chef-reporting'
  gem.version = Chef::Reporting::VERSION
  gem.license = "Apache 2.0"
  gem.author = "Opscode"
  gem.email = "info@opscode.com"
  gem.description = "Backport of Chef Reporting handler for Chef < 11.6.0"
  gem.summary = gem.description
  gem.homepage = "https://github.com/opscode/chef-reporting"

  gem.files = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  # TODO - Can we relax this dependency
  gem.add_dependency "chef", ">= 11.0.0"
end
