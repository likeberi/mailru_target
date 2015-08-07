module MailruTarget
  class RequestError < StandardError
    def initialize(e)
      super build_message e
    end

    private
      
    def build_message(e)
      body = JSON.parse e.response
      if body['error']
        "#{body['error']} : #{body['error_description']}"
      else
        body.map{ |field, error| "#{field}: #{error}" }.join(", ")
      end
    rescue
      e.response
    end
  end
end