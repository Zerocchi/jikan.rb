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
      expect(@char.raw['name']).to eq "Violate Behemoth"
    end
  end
end
