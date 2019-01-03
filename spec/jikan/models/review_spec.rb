require 'spec_helper'

RSpec.describe Jikan::Review do

  before do
    VCR.use_cassette "raw review" do  
      @reviews = Jikan::Query.new.anime_id 34798, :reviews
      @rev = @reviews.first
    end
  end

  describe ".review" do

    it "has raw data" do
      expect(@rev.raw).to be_a_kind_of Hash
      expect(@rev.raw['mal_id']).to eq 274533
    end

    it "show date" do
      expect(@rev.date).to eq "2018-03-22T07:31:00+00:00"
    end
    
    it "show helpful count" do
      expect(@rev.helpful_count).to eq 143
    end

    it "show link" do
      expect(@rev.url).to eq "https://myanimelist.net/reviews.php?id=274533"
    end

    it "show reviewer score" do
      expect(@rev.reviewer_scores).to be_a_kind_of Hash
      expect(@rev.reviewer_scores['overall']).to eq 9
    end

    it "raise exception if details method is used in Review object" do
      expect { @rev.details }.to raise_error(NoMethodError)
    end

    
  end
end
