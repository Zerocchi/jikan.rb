module Jikan
  class Club < BaseEntity
    def mal_id
      raw['mal_id']
    end

    def url
      raw['url']
    end
    
    def image_url
      raw['image_url']
    end

    def title
      raw['title']
    end

    def members_count
      raw['members_count']
    end

    def pictures_count
      raw['pictures_count']
    end

    def category
      raw['category']
    end

    def created
      raw['created']
    end

    def type
      raw['type']
    end

    def staff
      raw['staff'].map do |s|
        ClubEntity.new(s)
      end
    end

    def anime_relations
      raw['anime_relations'].map do |r|
        ClubEntity.new(r)
      end
    end

    def manga_relations
      raw['manga_relations'].map do |r|
        ClubEntity.new(r)
      end
    end

    def character_relations
      raw['character_relations'].map do |r|
        ClubEntity.new(r)
      end
    end
  end
  
  class ClubEntity < Entityography; end

  class ClubMember < BaseEntity
    
    def username
      raw['username']
    end

    def url
      raw['url']
    end

    def image_url
      raw['url']
    end
  end
end
