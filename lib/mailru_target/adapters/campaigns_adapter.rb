module MailruTarget
  module CampaignsAdapter

    def read_campaigns(presenter)
      request(:get, "/campaigns.json")
    end

    def create_campaign(presenter)
      request(:post, "/campaigns.json", presenter)
    end

    def read_campaign(id)
      request(:get, "/campaigns/#{id}.json")
    end

    def update_campaign(presenter)
      request(:post, "/campaigns/#{presenter.delete(:id)}.json", presenter)
    end

  end
end