module MailruTarget
  module ImagesAdapter

    def create_image(presenter)
      request(:post, "/images.json", presenter)
    end

  end
end