module Jikan
  class Search < BaseEntity

    def initialize(json, type)
      super(json)
      @type = type
      @search = true
    end

    def is_search?
      @search
    end

    def id
      iter { |i| i['id'] }
    end

    def title
      iter { |i| i['title'] }
    end
    
    def url
      iter { |i| i['url'] }
    end

    # returns each result items wrapped in their respective objects
    def result
      case @type
      when :anime
        iter { |i| Jikan::Anime.new(i) }
      when :manga
        iter { |i| Jikan::Manga.new(i) }
      when :character
        raise ClientError, "Character only return raw result for now."
      when :person
        raise ClientError, "Person only return raw result for now."
      end
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