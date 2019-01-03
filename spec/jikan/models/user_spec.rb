require 'spec_helper'

RSpec.describe Jikan::User do

  before do
    VCR.use_cassette "raw user" do  
      @user = Jikan::Query.new.user "ZerOne01"
    end

    VCR.use_cassette "raw user animelist" do  
      @user_animelist = Jikan::Query.new.user "ZerOne01", :animelist
    end
  end

  describe ".user" do
    it "has raw data" do
      expect(@user.raw).to be_a_kind_of Hash
      expect(@user.raw['joined']).to eq "2008-09-24T00:00:00+00:00"
    end

    it "show username" do
      expect(@user.name).to eq "ZerOne01"
    end

    it "show url" do
      expect(@user.url).to eq "https://myanimelist.net/profile/ZerOne01"
    end

    it "user favorites anime is array" do
      expect(@user.fav_anime).to be_a_kind_of Array
    end

    it "favorites anime is type of BasicAnime" do
      expect(@user.fav_anime.first).to be_a_kind_of Jikan::BasicAnime
    end

    it "favorites person is type of BasicPerson" do
      expect(@user.fav_people.first).to be_a_kind_of Jikan::BasicPerson
    end

    it "other flags return raw" do
      expect(@user_animelist.raw).to be_a_kind_of Hash
      expect(@user_animelist.raw["anime"]).to be_a_kind_of Array
    end
  end
end
