module Jikan
  class Manga < MediaEntity

    def author
      raw['author']
    end

    def chapters
      raw['chapters']
    end
    
    def published
      raw['published']
    end

    def volumes
      raw['volumes']
    end

  end
end
