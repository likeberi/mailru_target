# see https://target.mail.ru/doc/api/oauth2

module MailruTarget
  class Auth
    class << self
      include MailruTarget::Request

      def authorize_url
        state = (0...32).map { (65 + rand(26)).chr }.join.downcase
        "https://target.mail.ru/oauth2/authorize?response_type=code" <<
          "&client_id=#{MailruTarget.client_id}&state=#{state}&scope=#{MailruTarget.scopes}"
      end

      def get_token(code)
        params = { grant_type: "authorization_code", code: code, v: 2 }
        request :post, "/oauth2/token", params
      end

      def refresh_token(code)
        params = { grant_type: "refresh_token", refresh_token: code, v: 2 }
        request :post, "/oauth2/token", params
      end
    end
  end
end