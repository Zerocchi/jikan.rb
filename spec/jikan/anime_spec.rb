require 'spec_helper'

RSpec.describe Jikan::Anime do

  before do
    VCR.use_cassette "raw anime" do  
      @query = Jikan::Query.new.anime_id 34798
      @anime = Jikan::Anime.new @query.raw
    end

    VCR.use_cassette "search anime" do
      @search_anime = Jikan::search("Railgun").result[0]
    end
  end

  describe ".anime" do

    it "has raw data" do
      expect(@anime.raw).to be_a_kind_of Hash
      expect(@anime.raw['mal_id']).to eq 34798
    end

    it "show episodes" do
      expect(@anime.episodes).to eq 12
    end
    
    it "show duration" do
      expect(@anime.duration).to eq "23 min. per ep."
    end
    
    it "show title" do
      expect(@anime.title).to eq "Yuru Camp△"
    end

    it "show link" do
      expect(@anime.link).to eq "https://myanimelist.net/anime/34798/Yuru_Camp△"
    end

    it "parse detailed information and return new Anime object" do
      expect(@search_anime.details).to be_a_kind_of Jikan::Anime
      expect(@search_anime.details.opening).to be_a_kind_of Array
    end

    it "raise exception if details method is used in already full Anime object" do
      expect { @anime.details }.to raise_error(NoMethodError)
    end
  end
end
