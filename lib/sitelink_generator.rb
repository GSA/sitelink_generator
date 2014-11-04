require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/string/inflections'
require 'i18n'

require_relative 'sitelink_generator/base'
require_relative 'sitelink_generator/i18n'
require_relative 'sitelink_generator/version'

module SitelinkGenerator
  GENERATORS = Dir["#{File.dirname(__FILE__)}/sitelink_generator/generators/*.rb"].sort.collect do |path|
    generator_file_name = File.basename(path, '.rb')

    require_relative "sitelink_generator/generators/#{generator_file_name}"
    "SitelinkGenerator::#{generator_file_name.camelize}".constantize
  end.freeze

  GENERATOR_HASH = Hash[GENERATORS.collect { |g| [g.name, g] }].freeze
end
