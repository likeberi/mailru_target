module MailruTarget
  module PackagesAdapter

    def read_packages(presenter)
      request(:get, "/packages.json")
    end

  end
end