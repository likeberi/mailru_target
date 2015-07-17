module MailruTarget
  module ImagesAdapter

    def create_image(url)
      request(:post, "/images.json", File.new.open(url))
    end

  end
end