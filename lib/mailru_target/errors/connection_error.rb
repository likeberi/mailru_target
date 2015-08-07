module MailruTarget
  class ConnectionError < StandardError
    def initialize(e)
      @exception = e
    end
    
    def message
      @exception.message
    end
  end
end