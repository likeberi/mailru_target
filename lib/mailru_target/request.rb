module MailruTarget
  module Request
    API_URI = "https://target.my.com/"
    SUDO_API_URI = "https://target.my.com/users/"

    def request(method, path, params = {}, headers = {})
      JSON.parse make_request(method, path, params, headers).to_s
    end

    def make_request(method, path, params = {}, headers = {})
      begin
        RestClient.send *build(method, path, params, headers)

      rescue RestClient::Unauthorized,
             RestClient::Forbidden,
             RestClient::BadRequest,
             RestClient::ResourceNotFound => e
        raise MailruTarget::RequestError.new e

      rescue SocketError => e
        raise MailruTarget::ConnectionError.new e
      end
    end

    private

    def build(method, path, params, headers)
      path = get_uri(params) + "api/v#{params.delete(:v) || 1}" + path
      path << ".json" unless path.split("/").last["."]

      if params[:token]
        headers[:Authorization] = "Bearer #{params.delete :token}"
      else
        params.merge! client_id: MailruTarget.client_id, client_secret: MailruTarget.client_secret
      end

      case method
      when :get
        [:get, path, { params: params }.merge(headers)]
      when :post
        params = params[:grant_type] ? params : params.to_json
        [:post, path, params, headers]
      end
    end

    def get_uri(params)
      user = params.delete(:as_user)
      user ? "#{SUDO_API_URI}#{user}/" : API_URI
    end
  end
end

