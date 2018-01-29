require 'spec_helper'

RSpec.describe Jikan::Search do

  before do
    VCR.use_cassette "search anime" do  
      @query = Jikan::Query.new.search("Railgun", :anime)
      @search = Jikan::Search.new @query.raw
    end
  end

  describe ".search" do
    it "has raw data" do
      expect(@search.raw).to be_a_kind_of Hash
      expect(@search.raw["result"]).to be_a_kind_of Array
    end

    it "put search result IDs into an array" do
      expect(@search.id).to be_a_kind_of Array
      expect(@search.id[0]).to eq 6213
    end

    it "put search result titles into an array" do
      expect(@search.title).to be_a_kind_of Array
      expect(@search.title[0]).to eq "Toaru Kagaku no Railgun"
    end

    it "put search result URLs into an array" do
      expect(@search.title).to be_a_kind_of Array
      expect(@search.url[0]).to eq "https://myanimelist.net/anime/6213/Toaru_Kagaku_no_Railgun"
    end
  end
end
