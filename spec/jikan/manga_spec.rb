require 'spec_helper'

RSpec.describe Jikan::Manga do

  before do
    VCR.use_cassette "raw manga" do  
      @query = Jikan::Query.new.manga_id 15434
      @manga = Jikan::Manga.new @query.raw
    end
  end

  describe ".manga" do

    it "has raw data" do
      expect(@manga.raw).to be_a_kind_of Hash
      expect(@manga.raw['mal_id']).to eq 15434
    end

    it "show chapters" do
      expect(@manga.chapters).to eq 3
    end
    
    it "show volumes" do
      expect(@manga.volumes).to eq 1
    end
    
    it "show title" do
      expect(@manga.title).to eq "Koi Puzzle"
    end

    it "show link" do
      expect(@manga.link).to eq "https://myanimelist.net/manga/15434/Koi_Puzzle"
    end
  end
end
