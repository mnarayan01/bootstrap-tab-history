$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'bootstrap-tab-history-rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap-tab-history-rails"
  s.version     = BootstrapTabHistoryRails::VERSION
  s.authors     = ["Michael Narayan"]
  s.email       = ["mnarayan01@gmail.com"]
  s.homepage    = "https://github.com/mnarayan01/bootstrap-tab-history"
  s.summary     = "Use the HTML5 History API with bootstrap/tab."
  s.description = "Use the HTML5 History API with bootstrap/tab."

  s.files = Dir["{lib,vendor}/**/*"] + ["LICENSE", "README.md"]

  s.add_dependency 'railties', '>= 3.1'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end
