lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sitelink_generator/version'

Gem::Specification.new do |s|
  s.add_dependency 'i18n', '~> 0.6'
  s.add_dependency 'activesupport', '>= 3.2'
  s.add_development_dependency 'bundler', '~> 1.0'
  s.authors = ['DigitalGov Search']
  s.date = '2018-01-02'
  s.description = 'A DigitalGov Search sitelink generator'
  s.email = 'search@support.digitalgov.gov'
  s.files = %w(CONTRIBUTING.md LICENSE.md README.md sitelink_generator.gemspec)
  s.files += Dir['lib/**/*.rb']
  s.files += Dir['lib/**/*.yml']
  s.homepage = 'http://search.digitalgov.gov'
  s.license = 'MIT'
  s.name = 'sitelink_generator'
  s.required_ruby_version = '~> 2.1'
  s.summary = 'sitelink generator for DigitalGov Search'
  s.version = SitelinkGenerator::VERSION
end
