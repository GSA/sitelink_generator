require 'active_support/concern'
require 'active_support/core_ext/class/attribute'

module SitelinkGenerator
  module Base
    extend ActiveSupport::Concern

    included do
      class_eval do
        class_attribute :url_prefix, instance_writer: false
      end
    end
  end
end
