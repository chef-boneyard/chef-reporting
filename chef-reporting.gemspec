$:.unshift(File.dirname(__FILE__) + '/lib')
require 'chef/version'

Gem::Specification.new do |s|
  s.name = 'chef-reporting'
  s.version = "0.1.0"
  s.platform = Gem::Platform::RUBY
  s.extra_rdoc_files = ["README.md", "LICENSE" ]
  s.summary = "Plugin to enable reporting for Chef"
  s.description = s.summary
  s.author = "James Casey"
  s.email = "james@opscode.com"
  s.homepage = "http://docs.opscode.com"

  # TODO - Can we relax this dependency
  s.add_dependency "chef", ">= 11.4.0"
  s.files = %w(LICENSE README.md) + Dir.glob("lib/**/*")
  s.require_paths = ["lib"]
end
