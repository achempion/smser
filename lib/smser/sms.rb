require 'net/http'

module Smser

  class Sms

    class << self
      def pass text, numbers, adapter_params
        @text = text
        @settings = adapter_params.delete(:settings)
        @adapter_params = adapter_params

        if numbers.is_a? Array
          numbers.each { |phone| send_sms(phone) }
        else
          send_sms(numbers)
        end
      end

      private

      def send_sms phone
        Net::HTTP.post_form(@settings[:url], @adapter_params.merge(@settings[:text_code] => @text, @settings[:phone_code] => phone))
      end
    end

  end
end
