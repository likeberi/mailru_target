module MailruTarget
  module ClientsAdapter

    def read_clients
      request(:get, "/clients.json")
    end

    def create_client(presenter)
      request(:post, "/clients.json", presenter)
    end

  end
end