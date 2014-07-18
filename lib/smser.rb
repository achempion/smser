require "smser/version"
require "smser/configuration"
require "smser/sms"

module Smser
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield configuration
    end

    def adapters
      configuration.adapters.list
    end
  end

  def self.pass text, numbers, adapter_code = nil
    adapter_code ||= configuration.default_adapter

    Sms.pass text, numbers, adapters[ adapter_code ].marshal_dump
  end
end
