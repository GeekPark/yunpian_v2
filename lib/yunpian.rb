require 'yunpian/request'

module Yunpian
  class Yunpian
    SMS_GATEWAY = 'https://sms.yunpian.com'

    def initialize apikey
      @apikey = apikey
      @http = ::Yunpian::Request.new(SMS_GATEWAY)
    end

    def send mobile, text
      params = { 'apikey' => @apikey, 'mobile' => mobile, 'text' => text }
      @http.post('/v2/sms/single_send.json', params)
    end
  end
end
