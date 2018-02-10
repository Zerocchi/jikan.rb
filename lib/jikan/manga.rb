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

	class MangaResult < Manga
		def details(flag=nil)
			Jikan::manga id, flag
		end
	end
end
