module Iqdb
  module Client
    module Parser
      class Response
        def initialize(html_text)
          @page = Nokogiri::HTML.parse(html_text)
        end

        def success?
          @success ||= find_page_by_text('No relevant matches').first.nil?
        end

        def best_match
          @best_match ||= Result.new(find_page_by_text('Best match').first)
        end

        def additional_matches
          @additional_matches ||= find_page_by_text('Additional match').map { |match| Result.new(match) }
        end

        def possible_matches
          @possible_matches ||= find_page_by_text('Possible match').map { |match| Result.new(match) }
        end

        private

        attr_reader :page

        def find_page_by_text(text)
          pages.xpath(".//table[.//th[text() = \"#{text}\"]]")
        end

        def pages
          @pages ||= @page.xpath('//div[@id="pages"]')
        end
      end
    end
  end
end
