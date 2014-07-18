require 'ostruct'

module Smser

  class Configuration
    attr_accessor :default_adapter, :adapters

    def initialize
      self.adapters = Configuration::Adapters.new
    end

    class Adapters
      attr_reader :list

      def initialize
        @list = {}
      end

      def method_missing name, *args, &block
        super if name[-1] == '='

        return list[ name ] if list.keys.include? name

        list[ name ] = Adapter.new
      end

      class Adapter < OpenStruct
        attr_reader :settings

        def initialize
          super
          @settings = Struct.new(:url, :text_code, :phone_code).new
        end

        def marshal_dump
          super.merge settings: @settings.to_h
        end
      end
    end
  end
end