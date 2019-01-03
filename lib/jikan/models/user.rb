require 'jikan/models/entity'

module Jikan
  class User < BaseEntity
    def name
      raw['username']
    end
    
    def url
      raw['url']
    end

    def image_url
      raw['image_url']
    end

    def birthday
      raw['birthday']
    end

    def location
      raw['location']
    end

    def joined
      raw['joined']
    end
    
    def about
      raw['about']
    end

    def anime_stats
      raw['anime_stats']
    end

    def manga_stats
      raw['manga_stats']
    end

    def fav_anime
      raw['favorites']['anime'].map do |fa|
        Jikan::BasicAnime.new(fa)
      end
    end

    def fav_manga
      raw['favorites']['manga'].map do |fm|
        Jikan::BasicManga.new(fm)
      end
    end

    def fav_char
      raw['favorites']['characters'].map do |fc|
        Jikan::BasicCharacter.new(fc)
      end
    end

    def fav_people
      raw['favorites']['people'].map do |fp|
        Jikan::BasicPerson.new(fp)
      end
    end
  end
end