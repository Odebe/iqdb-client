module Iqdb
  module Client
    class Engine
      attr_reader :service_adapter

      def initialize(http:)
        @service_adapter = http
      end

      def from_link(link)
        Parser::Response.new(send(url: link))
      end

      # def from_file(io_path)
      #   response_body = send(file: Faraday::UploadIO.new(io_path, 'image/jpeg'))
      #   Parser::Response.new(response_body)
      # end

      private

      def send(params)
        # TODO: settings
        req_body = params # .merge(service: Array.new(13, 1))

        response = service_adapter.post('/') do |req|
          req.headers['Content-Type'] = 'multipart/form-data'
          req.body = req_body
        end

        response.body
      end
    end
  end
end
