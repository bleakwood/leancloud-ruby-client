# -*- encoding : utf-8 -*-
module AV
  module Cloud

    class Function
      attr_accessor :function_name

      def initialize(function_name)
        @function_name = function_name
      end

      def uri
        Protocol.cloud_function_uri(@function_name)
      end

      def call(params={})
        response = AV.client.post(self.uri, params.to_json)
        result = response["result"]
        result
      end
    end

    def self.request_sms(params)
      response = AV.client.post("/#{Protocol::VERSION}/requestSmsCode", params.to_json)
      return response == {}
    end
  end
end
