module Jikan
  class Search < BaseEntity

    def id
      iter('id')
    end

    def title
      iter('title')
    end
    
    def url
      iter('url')
    end

    private

    def iter(key)
      @raw['result'].map do |item|
        item[key]
      end
    end   
  end
end
