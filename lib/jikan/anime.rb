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
      raw['ending_theme']
    end

    def episodes
      raw['episodes']
    end

    def eps_list
      raw['episode']
    end

    def details(flag=nil)
      unless raw.has_key?('opening') || raw.has_key?('studio') 
        Jikan::anime id, flag
      else 
        raise NoMethodError, "Method only available for Anime object within Jikan::Search results."
      end
    end

    def licensor
      raw['licensor']
    end

    def opening
      raw['opening_theme']
    end

    def premiered
      raw['premiered']
    end

    def producer
      raw['producer']
    end

    def related
      raw['related']
    end

    def side_story
      raw['side_story']
    end

    def studio
      raw['studio']
    end
  end
end