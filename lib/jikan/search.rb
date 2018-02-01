module Jikan
  class Search < BaseEntity

    def id
      iter { |i| i['id'] }
    end

    def title
      iter { |i| i['title'] }
    end
    
    def url
      iter { |i| i['url'] }
    end

    # returns Jikan::Anime object in each result items
    def result
      iter { |i| Jikan::Anime.new(i) }
    end

    private

    def iter
      @raw['result'].map do |item|
        if block_given?
          yield item
        end
      end
    end   
  end
end