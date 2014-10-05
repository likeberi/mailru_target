module MailruTarget
  class RequestError < Exception
    def initialize(e)
      super build_message e
    end

    private
      
    def build_message(e)
      body = JSON.parse e.response
      "#{body['error']} : #{body['error_description']}" if body['error']
    rescue
      e.response
    end
  end
end