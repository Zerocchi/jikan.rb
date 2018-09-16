require 'jikan/entity'

module Jikan
  class Anime < MediaEntity

    def aired
      raw['aired']
    end
    
    def adaptation
      raw['related']['adaptation']
    end

    def background
      raw['background']
    end

    def broadcast
      raw['broadcast']
    end

    def duration
      raw['duration']
    end

    def ending
      raw['ending_theme'] || raw['ending_themes']
    end

    def episodes
      raw['episodes']
    end

    def eps_list
      raw['episode'] || raw['episodes']
    end
    
    def licensor
      raw['licensor'] || raw['licensors']
    end

    def opening
      raw['opening_theme'] || raw['opening_themes']
    end

    def premiered
      raw['premiered']
    end

    def producer
      raw['producer'] || raw['producers']
    end

    def related
      raw['related']
    end

    def side_story
      raw['side_story']
    end

    def studio
      raw['studio'] || raw['studios']
    end
  end

	class AnimeResult < Anime
		def details(flag=nil)
      Jikan::anime id, flag
		end
	end
end
