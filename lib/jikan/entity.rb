module Jikan
  class BaseEntity

    attr_reader :raw

    def initialize(json)
      @raw = json
    end

  end

  class MediaEntity < BaseEntity

    def favorites
      raw['favorites']
    end

    def genre
      raw['genre'] || raw['genres']
    end

    def id
      raw['id'] || raw['mal_id']
    end

    def image
      raw['image'] || raw['image_url']
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
      raw['synopsis'] || raw['description']
    end

    def link
      raw['link_canonical'] || raw['url']
    end

    def title
      raw['title']
    end

    def title_en
      raw['title_english']
    end

    def title_jp
      raw['japanese']
    end

    def title_synonyms
      raw['title_synonyms']
    end

    def type
      raw['type']
    end
  end
end