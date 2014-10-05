# see https://target.mail.ru/doc/api/detailed/

module MailruTarget
  class Session
    include MailruTarget::Request

    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def request(method, path, params = {})
      super method, path, params.merge({ token: token })
    end
  end
end