require 'jikan/query'

module Jikan
  class ExtensionError < StandardError; end
  class ClientError < StandardError; end

  BASE_URL = "http://api.jikan.me"
  BASE_URL_SSL = "https://api.jikan.me"

  FLAGS = {
    'anime' => [ :episodes, :characters_staff, :news, :pictures, :videos, :stats ],
    'manga' => [ :character, :news, :pictures, :stats ],
    'character' => [ :pictures ],
    'person' => [ :pictures ],
    'search' => [:anime, :manga, :person, :character]
  }
end
