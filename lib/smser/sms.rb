require 'net/http'

module Smser

  class Sms
    def self.pass text, numbers, adapter_params
      settings = adapter_params.delete(:settings)

      uri = URI(settings[:url])

      Net::HTTP.post_form(uri, adapter_params.merge(settings[:text_code] => text, settings[:phone_code] => numbers))
    end
  end
end
