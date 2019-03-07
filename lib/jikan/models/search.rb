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
      iter { |i| i['id'] || i['mal_id'] }
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
        iter { |i| Jikan::AnimeResult.new(i) }
      when :manga
        iter { |i| Jikan::MangaResult.new(i) }
      when :character
        iter { |i| Jikan::CharacterResult.new(i) }
      when :person
        iter { |i| Jikan::PersonResult.new(i) }
      end
    end

    private

    def iter
      if @raw.respond_to? 'each'
        @raw['results'].map do |item|
          if block_given?
            yield item
          end
        end
      else
        raise ClientError, "#{@raw['error']}"
      end
    end   
  end
end
