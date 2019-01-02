require 'jikan/models/entity'

module Jikan
  class Recommendation < BaseEntity

    def mal_id
      raw['mal_id']
    end

    def url
      raw['url']
    end

    def image_url
      raw['image_url']
    end

    def recommendation_url
      raw['recommendation_url']
    end

    def title
      raw['title']
    end

    def count
      raw['recommendation_count']
    end

  end
end