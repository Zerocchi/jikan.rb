require_relative 'jikan/api'
require_relative 'jikan/version'

module Jikan

  def self.anime_id(id, ext=nil)
    Jikan::API.new.get("anime", id, ext)
  end

  def self.manga_id(id)
    Jikan::API.new.get("manga", id)
  end

  def self.character_id(id, ext=nil)
    Jikan::API.new.get("character", id)
  end

  def self.person_id(id, ext=nil)
    Jikan::API.new.get("person", id)
  end

  def self.user_list_id(id, ext=nil)
    Jikan::API.new.get("user_list", id)
  end
end
