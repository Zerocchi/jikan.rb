require 'spec_helper'

RSpec.describe Jikan::Character do

  before do
    VCR.use_cassette "raw character" do  
      @query = Jikan::Query.new.character_id 32512
      @char = Jikan::Character.new @query.raw
    end
  end

  describe ".character" do
    it "has raw data" do
      expect(@char.raw).to be_a_kind_of Hash
      expect(@char.raw['mal_id']).to eq 32512
    end

    it "show character name" do
      expect(@char.name).to eq "Violate Behemoth"
    end

    it "show url" do
      expect(@char.url).to eq "https://myanimelist.net/character/32512/Violate_Behemoth"
    end

    it "animeography is array of type BasicAnime" do
      expect(@char.animeography).to be_a_kind_of Array
      expect(@char.animeography.first).to be_a_kind_of Jikan::BasicAnime
    end
  end
end
