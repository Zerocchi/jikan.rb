module Jikan
  class Person < BaseEntity
    def mal_id
      raw['mal_id']
    end

    def url
      raw['url']
    end
    
    def image_url
      raw['image_url']
    end

    def website_url
      raw['website_url']
    end

    def name
      raw['name']
    end

    def given_name
      raw['given_name']
    end

    def family_name
      raw['famly_name']
    end

    def alternate_name
      raw['alternate_name']
    end

    def birthday
      raw['birthday']
    end

    def member_fav
      raw['member_favorites']
    end

    def about
      raw['about']
    end

    def va_roles
      raw['voice_acting_roles']
    end

    def staff_position
      raw['anime_staff_position']
    end

    def published_manga
      raw['published_manga']
    end
  end
  
  class BasicPerson < Entityography; end

  class PersonResult < BasicPerson
    def alternative_names
      raw['alternative_names']
    end

    def details(flag=nil)
      Jikan::person_id id, flag
    end
    
    def anime
      raw['anime'].map do |a|
        Jikan::BasicAnime(a)
      end
    end

    def manga
      raw['manga'].map do |m|
        Jikan::BasicManga(m)
      end
    end
  end
end
