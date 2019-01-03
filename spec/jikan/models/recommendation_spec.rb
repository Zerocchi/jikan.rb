require 'spec_helper'

RSpec.describe Jikan::Recommendation do

  before do
    VCR.use_cassette "raw recommendation" do  
      @recs = Jikan::Query.new.anime_id 34798, :recommendations
      @rec = @recs.first
    end
  end

  describe ".recommendation" do

    it "has raw data" do
      expect(@rec.raw).to be_a_kind_of Hash
      expect(@rec.raw['mal_id']).to eq 14355
    end

    it "show rec url" do
      expect(@rec.recommendation_url).to eq "https://myanimelist.net/recommendations/anime/14355-34798"
    end
    
    it "show title" do
      expect(@rec.title).to eq "Yama no Susume"
    end

    it "show link" do
      expect(@rec.url).to eq "https://myanimelist.net/anime/14355/Yama_no_Susume"
    end

    it "show recommendation count" do
      expect(@rec.count).to eq 9
    end

    it "raise exception if details method is used in Recommendation object" do
      expect { @rec.details }.to raise_error(NoMethodError)
    end
  end
end
