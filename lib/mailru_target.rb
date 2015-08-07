require 'restclient'
require 'json'
require 'mailru_target/adapters/banners_adapter'
require 'mailru_target/adapters/campaigns_adapter'
require 'mailru_target/adapters/clients_adapter'
require 'mailru_target/adapters/images_adapter'
require 'mailru_target/adapters/packages_adapter'

module MailruTarget

  autoload :Auth, 'mailru_target/auth'
  autoload :Request, 'mailru_target/request'
  autoload :Session, 'mailru_target/session'

  autoload :ConnectionError,  'mailru_target/errors/connection_error'
  autoload :RequestError,     'mailru_target/errors/request_error'

  class << self
    attr_accessor :client_id, :client_secret, :scopes

    def scopes
      @scopes || 'read_ads,read_payments,create_ads'
    end
  end
end
