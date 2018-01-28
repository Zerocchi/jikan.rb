require 'jikan/anime'
require 'jikan/api'
require 'jikan/character'
require 'jikan/manga'
require 'jikan/person'
require 'jikan/search'

module Jikan
  class Query

    def initialize
      @json = nil
    end

    def anime_id(id, ext=nil)
      @json = Jikan::API.new.get("anime", id, ext)
      Jikan::Anime.new(@json)
    end

    def manga_id(id, ext=nil)
      @json = Jikan::API.new.get("manga", id, ext)
      Jikan::Manga.new(@json)
    end

    def character_id(id, ext=nil)
      @json = Jikan::API.new.get("character", id, ext)
      Jikan::Character.new(@json)
    end

    def person_id(id, ext=nil)
      @json = Jikan::API.new.get("person", id, ext)
      Jikan::Person.new(@json)
    end

    def search(title, type=:anime, page=1)
      @json = Jikan::API.new.get("search", page, type, title)
      Jikan::Search.new(@json)
    end
    
	end
end
