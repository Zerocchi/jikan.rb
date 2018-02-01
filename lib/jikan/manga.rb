module Jikan
  class Manga < MediaEntity

    def author
      raw['author']
    end

    def chapters
      raw['chapters']
    end
    
    def full(flag=nil)
      if
        published.nil? || popularity.nil?
      then 
        Jikan::manga id, flag 
      else 
        raise NoMethodError, "Method only available for Jikan::Search results."
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
