require 'jikan/entity'

module Jikan
  class UserUpdate < BaseEntity
    
    def username
      raw['username']
    end

    def url
      raw['url']
    end

    def image_url
      raw['image_url']
    end

    def score
      raw['score']
    end

    def status
      raw['status']
    end

    def eps_seen
      raw['episodes_seen']
    end

    def eps_total
      raw['episodes_total']
    end

    def date
      raw['date']
    end
  end
end