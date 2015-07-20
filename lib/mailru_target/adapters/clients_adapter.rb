module MailruTarget
  module ClientsAdapter

    def read_clients(presenter)
      request(:get, "/clients.json")
    end

    def create_client(presenter)
      request(:post, "/clients.json", presenter)
    end

    def get_token(presenter)
      request(
        :post,
        "/oauth2/token.json",
        {
          grant_type: "agency_client_credentials",
          client_id: presenter[:client_id],
          client_secret: presenter[:client_secret],
          agency_client_name: presenter[:client_username]
        }
      )
    end

  end
end