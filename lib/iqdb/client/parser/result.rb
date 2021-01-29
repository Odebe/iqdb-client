module Iqdb
  module Client
    module Parser
      class Result
        attr_reader :nokogiri_obj

        def initialize(nokogiri_obj)
          @nokogiri_obj = nokogiri_obj
        end

        def link
          @link ||= @nokogiri_obj.xpath('.//a[1]/@href').text
        end

        def alt
          @alt ||= Alt.new(@nokogiri_obj.xpath('.//td[@class="image"]//img[1]/@alt').text)
        end

        def info
          { link: link, tags: alt.tags, rating: alt.rating }
        end
      end
    end
  end
end
