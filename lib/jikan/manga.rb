module Jikan
  class Manga < MediaEntity

    def author
      raw['author']
    end

    def chapters
      raw['chapters']
    end
    
    def details(flag=nil)
      unless raw.has_key?('published') || raw.has_key?('popularity') 
        Jikan::manga id, flag 
      else 
        raise NoMethodError, "Method only available for Manga object within Jikan::Search results."
      end
    end

    def published
      raw['published']
    end

    def volumes
      raw['volumes']
    end

  end
end
