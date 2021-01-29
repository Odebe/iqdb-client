module Iqdb
  module Client
    module Parser
      class Alt
        attr_reader :str

        def initialize(str)
          @str = str
        end

        def tags
          @tags ||= str.scan(/Tags:(.+)$/).then { |m| m.empty? ? [] : m[0][0].split(' ') }
        end

        def rating
          @rating ||= str.scan(/Rating:\s(\w)\s/).then { |m| m.empty? ? '' : m[0][0] }
        end
      end
    end
  end
end
