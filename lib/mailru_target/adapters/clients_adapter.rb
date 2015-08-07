module MailruTarget
  module ClientsAdapter

    def read_clients(presenter)
      request(:get, "/clients.json")
    end

    def create_client(presenter)
      request(:post, "/clients.json", presenter)
    end

    def get_token_client(presenter)
      request(
        :post,
        "/oauth2/token.json",
        presenter.merge(
          grant_type: "agency_client_credentials",
          v: 2
        )
      )
    end

    def refresh_token_client(presenter)
      request(
        :post,
        "/oauth2/token.json",
        presenter.merge(
          grant_type: "refresh_token",
          v: 2
        )
      )
    end

  end
end