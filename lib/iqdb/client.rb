require_relative "./client/version.rb"
require_relative "./client/engine.rb"
require_relative "./client/parser/response.rb"
require_relative "./client/parser/result.rb"
require_relative "./client/parser/alt.rb"

require 'faraday'
require 'nokogiri'

module Iqdb
  module Client
    OFFICIAL_2D = 'https://www.iqdb.org/'.freeze
    OFFICIAL_3D = 'https://3d.iqdb.org/'.freeze

    def self.new(service: OFFICIAL_2D)
      faraday = Faraday.new(service) do |f|
        f.use Faraday::Response::RaiseError
        f.request :multipart
      end

      Engine.new(http: faraday)
    end
  end
end


