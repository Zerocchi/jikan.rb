require 'spec_helper'

RSpec.describe Jikan::Person do

  before do
    VCR.use_cassette "raw person" do  
      @query = Jikan::Query.new.person_id 2211
      @person = Jikan::Person.new @query.raw
    end
  end

  describe ".person" do
    it "has raw data" do
      expect(@person.raw).to be_a_kind_of Hash
      expect(@person.raw['mal_id']).to eq 2211
    end

    it "show person name" do
      expect(@person.name).to eq "Makoto Tateno"
    end

    it "show given name" do
      expect(@person.given_name).to eq "真琴"
    end

    it "published manga is array" do
      expect(@person.published_manga).to be_a_kind_of Array
    end
  end
end
