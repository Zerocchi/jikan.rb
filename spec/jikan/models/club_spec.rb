require 'spec_helper'

RSpec.describe Jikan::Club do

  before do
    VCR.use_cassette "raw club" do  
      @club = Jikan::Query.new.club_id 1
    end

    VCR.use_cassette "raw club members" do  
      @members = Jikan::Query.new.club_id 1, :members
      @member = @members.first
    end
  end

  describe ".club#general" do

    it "has raw data" do
      expect(@club.raw).to be_a_kind_of Hash
      expect(@club.raw['mal_id']).to eq 1
    end

    it "show club url" do
      expect(@club.url).to eq "https://myanimelist.net/clubs.php?cid=1"
    end
    
    it "show created" do
      expect(@club.created).to eq "2007-03-29T00:00:00+00:00"
    end

    it "anime relations is ClubEntity array" do
      expect(@club.anime_relations).to be_a_kind_of Array
      expect(@club.anime_relations.first).to be_a_kind_of Jikan::ClubEntity
    end

    it "raise exception if details method is used in Club object" do
      expect { @club.details }.to raise_error(NoMethodError)
    end
  end

  describe ".club#members" do

    it "has raw data" do
      expect(@members).to be_a_kind_of Array
    end

    it "array is a type of ClubMember" do
      expect(@member).to be_a_kind_of Jikan::ClubMember
    end
  end
end
