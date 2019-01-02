require 'jikan/models/entity'

module Jikan
  class News < BaseEntity

    def url
      raw['url']
    end

    def title
      raw['title']
    end

    def date
      raw['date']
    end

    def author_name
      raw['author_name']
    end

    def author_url
      raw['author_url']
    end

    def forum_url
      raw['forum_url']
    end

    def image_url
      raw['image_url']
    end

    def comments
      raw['comments']
    end

    def intro
      raw['intro']
    end

  end 
end