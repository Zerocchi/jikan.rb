require 'spec_helper'

RSpec.describe Jikan::Query do

  before do
    @query = Jikan::Query.new
  end

  describe "query" do
    it "return Query object" do
      expect(@query).to be_a_kind_of(Jikan::Query)
    end
  end

  describe "#anime_id" do
    it "return Anime object" do
      VCR.use_cassette "raw anime" do
        @anime = @query.anime_id 34798
        expect(@anime).to be_a_kind_of(Jikan::Anime)
      end
    end
    
    it "return anime title" do
      VCR.use_cassette "raw anime" do
        @anime = @query.anime_id 34798
        yuru = @anime.title
        expect(yuru).to eq "Yuru Camp△"
      end
    end
    
    it "return episodes list when using extension token" do
      VCR.use_cassette "raw anime ext" do
        @anime = @query.anime_id 34798, :episodes
        episodes = @anime.eps_list
        expect(episodes).to be_a_kind_of(Array)
      end
    end

    it "raise exception when using invalid token" do
      VCR.use_cassette "raw anime" do
        expect { @query.anime_id 34798, :invalid }
        .to raise_error(Jikan::ExtensionError)
      end
    end
  end

  describe "#manga_id" do
    it "return manga object and type" do
      VCR.use_cassette "raw manga" do
        @manga = @query.manga_id 15434
        expect(@manga).to be_a_kind_of(Jikan::Manga)
        expect(@manga.type).to eq "Manga"
      end
    end
  end

  describe "#character_id" do
    it "return character raw result" do
      VCR.use_cassette "raw character" do
        @character = @query.character_id 32512
        expect(@character.raw).to be_a_kind_of Hash
        expect(@character.raw['mal_id']).to eq 32512
        expect(@character.raw['name']).to eq "Violate Behemoth"
      end
    end
  end

  describe "#person_id" do
    it "return person raw result" do
      VCR.use_cassette "raw person" do
        @person = @query.person_id 2211
        expect(@person.raw).to be_a_kind_of Hash
        expect(@person.raw['mal_id']).to eq 2211
        expect(@person.raw['name']).to eq "Makoto Tateno"
      end
    end
  end

  describe "#search" do
    it "return anime search result" do
      VCR.use_cassette "search anime" do
        @anime_search = @query.search("Railgun", :anime)
        expect(@anime_search.raw).to be_a_kind_of Hash
        expect(@anime_search.raw["result"]).to be_a_kind_of Array
        expect(@anime_search.raw["result"][0].has_key? "id").to be true
      end
    end

    it "raise exception on invalid token", :vcr do
      VCR.use_cassette "search anime" do
        expect { @query.search("Railgun", :invalid) }
        .to raise_error(Jikan::ExtensionError)
      end
    end
  end
end
