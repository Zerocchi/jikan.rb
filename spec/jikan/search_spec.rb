require 'spec_helper'

RSpec.describe Jikan::Search do

  before do
    VCR.use_cassette "search anime" do  
      @anime_query = Jikan::Query.new.search("Railgun", :anime)
      @anime_search = Jikan::Search.new(@anime_query.raw, :anime)
    end

    VCR.use_cassette "search manga" do
      @manga_query = Jikan::Query.new.search("Railgun", :manga)
      @manga_search = Jikan::Search.new(@manga_query.raw, :manga)
    end
    
    VCR.use_cassette "search character" do
      @character_query = Jikan::Query.new.search("Misaka Mikoto", :character)
      @character_search = Jikan::Search.new(@character_query.raw, :character)
    end

    VCR.use_cassette "search person" do
      @person_query = Jikan::Query.new.search("Satou Rina", :person)
      @person_search = Jikan::Search.new(@person_query, :person)
    end
  end

  describe ".search" do
    
    describe "#raw" do
      it "has raw data" do
        expect(@anime_search.raw).to be_a_kind_of Hash
        expect(@anime_search.raw["result"]).to be_a_kind_of Array
      end
    end
    
    describe "#id" do
      it "put search result IDs into an array" do
        expect(@anime_search.id).to be_a_kind_of Array
        expect(@anime_search.id[0]).to eq 6213
      end
    end

    describe "#title" do
      it "put search result titles into an array" do
        expect(@anime_search.title).to be_a_kind_of Array
        expect(@anime_search.title[0]).to eq "Toaru Kagaku no Railgun"
      end
    end
    
    describe "#url" do
      it "put search result URLs into an array" do
        expect(@anime_search.title).to be_a_kind_of Array
        expect(@anime_search.url[0]).to eq "https://myanimelist.net/anime/6213/Toaru_Kagaku_no_Railgun"
      end
    end

    describe "#result" do
      it "wrap default search result into Jikan::Anime objects" do
        expect(@anime_search.result).to be_a_kind_of Array
        expect(@anime_search.result[0]).to be_a_kind_of Jikan::Anime
        expect(@anime_search.result[0].title).to eq "Toaru Kagaku no Railgun"
      end

      it "wrap :manga search result into Jikan::Manga objects" do
        expect(@manga_search.result).to be_a_kind_of Array
        expect(@manga_search.result[0]).to be_a_kind_of Jikan::Manga
        expect(@manga_search.result[0].title).to eq "Toaru Majutsu no Index Gaiden: Toaru Kagaku no Railgun"
      end

      it "raise exception for :character and :person results" do
        expect { @character_search.result }.to raise_error(NoMethodError)
        expect { @person_search.result }.to raise_error(NoMethodError)
      end
    end
  end
end
