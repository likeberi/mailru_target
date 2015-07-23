module MailruTarget
  module ImagesAdapter

    def create_image(presenter)
      presenter[:image_file] = File.new(presenter[:image_file], "rb")
      request(:post, "/images.json", presenter.merge({ grant_type: '' }))
    end

  end
end