module Jikan
  class BaseEntity

    def initialize(json)
      @raw = json
    end

    def raw
      @raw
    end
  end

  class MediaEntity < BaseEntity

    def favorites
      raw['favorites']
    end

    def genre
      raw['genre']
    end

    def image
      raw['image']
    end

    def members
      raw['members']
    end

    def popularity
      raw['popularity']
    end

    def ranked
      raw['ranked']
    end

    def rating
      raw['rating']
    end

    def status
      raw['status']
    end

    def score
      raw['score']
    end

    def source
      raw['source']
    end

    def synonyms
      raw['synonyms']
    end

    def synopsis
      raw['synopsis']
    end

    def link
      raw['link-canonical']
    end

    def title
      raw['title']
    end

    def title_en
      raw['title-english']
    end

    def title_jp
      raw['japanese']
    end

    def type
      raw['type']
    end
  end
end