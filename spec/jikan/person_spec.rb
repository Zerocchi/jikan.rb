require 'spec_helper'

RSpec.describe Jikan::Person do

  before do
    VCR.use_cassette "raw person" do  
      @query = Jikan::Query.new.person_id 2211
      @person = Jikan::Character.new @query.raw
    end
  end

  describe ".person" do
    it "has raw data" do
      expect(@person.raw).to be_a_kind_of Hash
      expect(@person.raw['mal_id']).to eq 2211
      expect(@person.raw['name']).to eq "Makoto Tateno"
    end
  end
end
