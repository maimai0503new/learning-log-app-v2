require 'metainspector'

module Services
  class OgpService
    def self.fetch(url)
      new(url).fetch
    rescue => e
      Rails.logger.error "OgpService Error: #{e.message}"
      nil
    end

    def initialize(url)
      @url = url
    end

    def fetch
      page = MetaInspector.new(@url, connection_timeout: 5, read_timeout: 5)
      {
        title: page.best_title,
        description: page.best_description,
        image_url: page.images.best
      }
    end
  end
end
