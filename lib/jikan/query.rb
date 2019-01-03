require 'require_all'
require_all 'lib/jikan/models'
require 'jikan/api'

module Jikan
  class Query

    def initialize
      @json = nil
    end

    def anime_id(id, flag=nil)
      @json = Jikan::API.new.get(endpoint: "anime", id: id, flag: flag)
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
      @json = Jikan::API.new.get(endpoint: "manga", id: id, flag: flag)
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
      @json = Jikan::API.new.get(endpoint: "character", id: id, flag: flag)
      if flag == nil
        Jikan::Character.new(@json)
      elsif flag == :pictures
        @json['pictures'].map do |pic|
          Jikan::Picture.new(pic)
        end
      end
    end

    def person_id(id, flag=nil)
      @json = Jikan::API.new.get(endpoint: "person", id: id, flag: flag)
      if flag == nil
        Jikan::Person.new(@json)
      elsif flag == :pictures
        @json['pictures'].map do |pic|
          Jikan::Picture.new(pic)
        end
      end
    end

    def club_id(id, flag=nil)
      @json = Jikan::API.new.get(endpoint: "club", id: id, flag: flag)
      if flag == nil
        Jikan::Club.new(@json)
      elsif flag == :members
        @json['members'].map do |member|
          Jikan::ClubMember.new(member)
        end
      end
    end

    def user(name, flag=:profile)
      @json = Jikan::API.new.get(endpoint: "user", query: name, flag: flag)
      if flag == :profile
        Jikan::User.new(@json)
      elsif(flag == :animelist)
        Jikan::BaseEntity.new(@json)
      elsif(flag == :mangalist)
        Jikan::BaseEntity.new(@json)
      elsif(flag == :friends)
        Jikan::BaseEntity.new(@json)
      elsif(flag == :history)
        Jikan::BaseEntity.new(@json)
      end
    end

    def search(title, type=:anime, page=1)
      @json = Jikan::API.new.get(endpoint: "search", page: page, flag: type, query: title)
      Jikan::Search.new(@json, type)
    end

    def season(season, year=Date.today.year)
      @json = Jikan::API.new.get(endpoint: "season", year: year, flag: season.to_sym)
      @json['anime'].map do |a|
        Jikan::Anime.new(a)
      end
    end
	end
end
