require 'spec_helper'

RSpec.describe Jikan::Manga do

  before do
    VCR.use_cassette "raw manga" do  
      @query = Jikan::Query.new.manga_id 15434
      @manga = Jikan::Manga.new @query.raw
    end

    VCR.use_cassette "search manga" do
      @search_manga = Jikan::search("Railgun", :manga).result[0]
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

    it "parse details information and return new Manga object" do
      expect(@search_manga.details).to be_a_kind_of Jikan::Manga
      expect(@search_manga.details.published).to be_a_kind_of Hash
    end

    it "raise exception if full method is used in Manga object" do
      expect { @manga.details }.to raise_error(NoMethodError)
    end
  end
end

