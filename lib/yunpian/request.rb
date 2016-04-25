require 'net/http'
require 'uri'
require 'json'
require 'openssl'

module Yunpian
  class Request
    def initialize endpoint
      uri = URI.parse(endpoint)
      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    end

    def post path, params
      request = Net::HTTP::Post.new(path)
      request.add_field('Accept', 'application/json;charset=utf-8;')
      request.add_field('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8;')
      request.set_form_data(params)
      JSON.parse(@http.request(request).body)
    end
  end
end
