require 'spec_helper'

RSpec.describe Jikan::Anime do

  before do
    VCR.use_cassette "season later" do  
      @later = Jikan::Query.new.season('later')
    end

    VCR.use_cassette "season specific" do
      @specific = Jikan::Query.new.season 'winter', 2018
      @first_specific = @specific.first
    end
  end

  describe ".season#later" do

    it "has raw data" do
      expect(@later).to be_a_kind_of Array
    end

    it "returns Anime objects" do
      expect(@later.first).to be_a_kind_of Jikan::Anime
    end
    
    it "raise exception if details method is used in Anime object" do
      expect { @later.first.details }.to raise_error(NoMethodError)
    end
  end

  describe ".season#specific" do

    it "has raw data" do
      expect(@specific).to be_a_kind_of Array
    end

    it "returns Anime objects" do
      expect(@specific.first).to be_a_kind_of Jikan::Anime
    end

    it "show score" do
      expect(@first_specific.score).to eq 8.6
    end
    
    it "show title" do
      expect(@first_specific.title).to eq "Violet Evergarden"
    end

    it "show link" do
      expect(@first_specific.link).to eq "https://myanimelist.net/anime/33352/Violet_Evergarden"
    end
  end
end
