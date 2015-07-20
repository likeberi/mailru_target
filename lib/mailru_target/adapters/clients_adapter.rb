module MailruTarget
  module ClientsAdapter

    def read_clients(presenter)
      request(:get, "/clients.json")
    end

    def create_client(presenter)
      request(:post, "/clients.json", presenter)
    end

  end
end