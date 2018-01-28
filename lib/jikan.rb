require 'jikan/anime'
require 'jikan/api'
require 'jikan/character'
require 'jikan/manga'
require 'jikan/version'

module Jikan

  def self.anime_id(id, ext=nil)
    json = Jikan::API.new.get("anime", id, ext)
    Jikan::Anime.new(json)
  end

  def self.manga_id(id)
    json = Jikan::API.new.get("manga", id)
    Jikan::Manga.new(json)
  end

  def self.character_id(id, ext=nil)
    json = Jikan::API.new.get("character", id)
    Jikan::Character.new(json)
  end

  def self.person_id(id, ext=nil)
    Jikan::API.new.get("person", id)
  end

  def self.user_list_id(id, ext=nil)
    Jikan::API.new.get("user_list", id)
  end
end
