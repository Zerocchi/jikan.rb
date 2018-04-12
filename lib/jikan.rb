require 'jikan/query'

module Jikan
  class FlagError < StandardError; end
  class ClientError < StandardError; end

  BASE_URL = "http://api.jikan.moe"
  BASE_URL_SSL = "https://api.jikan.moe"

  FLAGS = {
    'anime' => [ :episodes, :characters_staff, :news, :pictures, :videos, :stats ],
    'manga' => [ :character, :news, :pictures, :stats ],
    'character' => [ :pictures ],
    'person' => [ :pictures ],
    'search' => [:anime, :manga, :person, :character]
  }

  # shortcut methods
  def self.anime(id, flag=nil)
    Jikan::Query.new.anime_id(id, flag)
  end
  
  def self.manga(id, flag=nil)
    Jikan::Query.new.manga_id(id, flag)
  end
  
  def self.character(id, flag=nil)
    Jikan::Query.new.character_id(id, flag)
  end
  
  def self.person(id, flag=nil)
    Jikan::Query.new.person_id(id, flag)
  end
  
  def self.search(query, flag=:anime, page=1)
    Jikan::Query.new.search(query, flag, page)
  end
end
