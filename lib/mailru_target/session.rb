# see https://target.my.com/doc/api/detailed/

module MailruTarget
  class Session
    include MailruTarget::Request

    include MailruTarget::CampaignsAdapter
    include MailruTarget::BannersAdapter
    include MailruTarget::ClientsAdapter
    include MailruTarget::ImagesAdapter
    include MailruTarget::PackagesAdapter

    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def request(method, path, params = {})
      super method, path, params.merge({ token: token })
    end

    def call(method, action, params = {})
      if self.respond_to?("#{action}_#{method}")
        send("#{action}_#{method}", params)
      else
        Rails.logger.info "[ERROR] Called undefined myTarget API method or entity '#{action}_#{method}' with params: #{params.to_s}"
        false
      end
    end
  end
end
