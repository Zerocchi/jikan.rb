module Jikan
  class Character < BaseEntity
    def mal_id
      raw['mal_id']
    end

    def url
      raw['url']
    end
    
    def name
      raw['name']
    end

    def image_url
      raw['image_url']
    end

    def name_kanji
      raw['name_kanji']
    end

    def nicknames
      raw['nicknames']
    end

    def about
      raw['about']
    end

    def member_fav
      raw['member_favorites']
    end

    def animeography
      raw['animeography'].map do |a|
        Jikan::BasicAnime.new(a)
      end
    end

    def mangaography
      raw['mangaography'].map do |m|
        Jikan::BasicManga.new(m)
      end
    end

    def va
      raw['voice_actors'].map do |va|
				Jikan::VoiceActor.new(va)
			end
    end
  end
  
  class BasicCharacter < Entityography; end
end
