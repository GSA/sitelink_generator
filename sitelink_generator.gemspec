Gem::Specification.new do |s|
  s.add_dependency 'i18n', '~> 0.6'
  s.add_dependency 'activesupport', '~> 3.2'
  s.add_development_dependency 'bundler', '~> 1.0'
  s.authors = ['DigitalGov Search']
  s.date = '2010-10-29'
  s.description = 'A DigitalGov Search sitelink generator'
  s.email = 'search@support.digitalgov.gov'
  s.files = %w(CONTRIBUTING.md LICENSE.md README.md sitelink_generator.gemspec)
  s.files += Dir['lib/**/*.rb']
  s.files += Dir['lib/**/*.yml']
  s.homepage = 'http://search.digitalgov.gov'
  s.license = 'MIT'
  s.name = 'sitelink_generator'
  s.summary = 'sitelink generator for DigitalGov Search'
  s.version = '0.1.0'
end
