module MailruTarget
  module Request
    API_URI = "https://target.mail.ru/api"

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
      path = API_URI + "/v#{params.delete(:v) || 1}" + path
      path << ".json" unless path.split("/").last["."]

      if params[:token]
        headers[:Authorization] = "Bearer #{params.delete :token}"
      else
        params.merge! client_id: MailruTarget.client_id, client_secret: MailruTarget.client_secret
      end

      case method
      when :get  then [:get, path, { params: params }.merge(headers)]
      when :post then [:post, path, params, headers]
      end
    end
  end
end