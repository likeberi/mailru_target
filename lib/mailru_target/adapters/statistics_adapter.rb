module MailruTarget
  module StatisticsAdapter

    # @see https://target.my.com/doc/api/detailed/#resource_statistics
    # @param options [Hash]
    #   object_type: [String] (banners, campaigns, pad_groups, pads)
    #   object_ids: [Array]
    #   stat_type: [String] (hour, day)
    #   date_from: [String] (optional) DD.MM.YYYY
    #   date_to: [String] (optional) DD.MM.YYYY
    def read_statistics(options)
      dates = ''
      dates = "/#{options[:date_from]}-#{options[:date_to]}" unless options[:date_from].blank? && options[:date_to].blank?
      request(:get, "/statistics/#{options[:object_type]}/#{options[:object_ids].join(';')}/#{options[:stat_type]}#{dates}.json")
    end

    # @see https://target.my.com/doc/api/detailed/#resource_statistics
    # @param options [Hash]
    #   object_type: [String] (banners, campaigns, users)
    #   object_ids: [Array]
    def read_faststat(options)
      request(:get, "/statistics/faststat/#{options[:object_type]}/#{options[:object_ids].join(';')}.json")
    end

    # @see https://target.my.com/doc/api/detailed/#resource_conversion_statistics
    # @param options [Hash]
    #   object_type: [String] (banners, campaigns)
    #   object_ids: [Array]
    #   date_from: [String] DD.MM.YYYY
    #   date_to: [String] DD.MM.YYYY
    def read_convertions(options)
      request(:get, "/statistics/#{options[:object_type]}/#{options[:object_ids].join(';')}/conversions/#{options[:date_from]}-#{options[:date_to]}.json")
    end

  end
end
