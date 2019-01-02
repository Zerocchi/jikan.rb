require 'jikan/anime'
require 'jikan/api'
require 'jikan/character'
require 'jikan/manga'
require 'jikan/person'
require 'jikan/search'
require 'jikan/review'
require 'jikan/picture'
require 'jikan/news'
require 'jikan/recommendation'
require 'jikan/userupdate'
require 'jikan/stat'
require 'jikan/char_staff'

module Jikan
  class Query

    def initialize
      @json = nil
    end

    def anime_id(id, flag=nil)
      @json = Jikan::API.new.get("anime", id, flag)
      if flag == nil
        Jikan::Anime.new(@json)
      elsif flag == :episodes
        Jikan::Anime.new(@json)
      elsif flag == :reviews
        @json['reviews'].map do |review|
          Jikan::Review.new(review)
        end
      elsif flag == :news
        @json['articles'].map do |news|
          Jikan::News.new(news)
        end
      elsif flag == :recommendations
        @json['recommendations'].map do |rec|
          Jikan::Recommendation.new(rec)
        end
      elsif flag == :userupdates
        @json['users'].map do |user|
          Jikan::UserUpdate.new(user)
        end
      elsif flag == :pictures
        @json['pictures'].map do |pic|
          Jikan::Picture.new(pic)
        end
      elsif flag == :characters_staff
        @json['characters'].map do |cs|
          Jikan::CharacterStaff.new(cs)
        end
      elsif flag == :stats
        Jikan::Stat.new(@json)
      end
      
    end

    def manga_id(id, flag=nil)
      @json = Jikan::API.new.get("manga", id, flag)
      if flag == nil
        Jikan::Manga.new(@json)
      elsif flag == :reviews
        @json['reviews'].map do |review|
          Jikan::Review.new(review)
        end
      elsif flag == :news
        @json['articles'].map do |news|
          Jikan::News.new(news)
        end
      elsif flag == :recommendations
        @json['recommendations'].map do |rec|
          Jikan::Recommendation.new(rec)
        end
      elsif flag == :userupdates
        @json['users'].map do |user|
          Jikan::UserUpdate.new(user)
        end
      elsif flag == :pictures
        @json['pictures'].map do |pic|
          Jikan::Picture.new(pic)
        end
      elsif flag == :stats
        Jikan::Stat.new(@json)
      end
    end

    def character_id(id, flag=nil)
      @json = Jikan::API.new.get("character", id, flag)
      if flag == nil
        Jikan::Character.new(@json)
      elsif flag == :pictures
        @json['pictures'].map do |pic|
          Jikan::Picture.new(pic)
        end
      end
    end

    def person_id(id, flag=nil)
      @json = Jikan::API.new.get("person", id, flag)
      if flag == nil
        Jikan::Person.new(@json)
      elsif flag == :pictures
        @json['pictures'].map do |pic|
          Jikan::Picture.new(pic)
        end
      end
    end

    def search(title, type=:anime, page=1)
      @json = Jikan::API.new.get("search", page, type, title)
      Jikan::Search.new(@json, type)
    end

    def season(season, year=Date.today.year)
      @json = Jikan::API.new.get("season", year, season)
      @json['anime'].map do |a|
        Jikan::Anime.new(a)
      end
    end
    
	end
end
