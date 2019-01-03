require 'spec_helper'

RSpec.describe Jikan::News do

  before do
    VCR.use_cassette "raw news" do  
      @news_array = Jikan::Query.new.anime_id 34798, :news
      @news = @news_array.last
    end
  end

  describe ".news" do

    it "has raw data" do
      expect(@news.raw).to be_a_kind_of Hash
      expect(@news.raw['comments']).to eq 15
    end

    it "show news url" do
      expect(@news.url).to eq "https://myanimelist.net/news/49397864"
    end
    
    it "show title" do
      expect(@news.title).to eq "Manga 'Yuru Camp△' Receives Anime Adaptation"
    end

    it "raise exception if details method is used in News object" do
      expect { @news.details }.to raise_error(NoMethodError)
    end
  end
end
