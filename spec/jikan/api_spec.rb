require 'spec_helper'

RSpec.describe Jikan::API do
  
  before do
    @api = Jikan::API.new
  end

  describe ".api" do
    it "return API object" do
      expect(@api).to be_a_kind_of(Jikan::API)
    end
  end

  describe "#get" do

    it "return result for anime endpoint" do
      VCR.use_cassette "raw anime" do
        @anime = @api.get(endpoint: 'anime', id: 34798)
        expect(@anime).to be_a_kind_of(Hash)
        expect(@anime['mal_id']).to eq 34798
      end
    end

    it "return result based on flag given" do
      VCR.use_cassette "raw anime ext" do
        @anime = @api.get(endpoint: 'anime', id: 34798, flag: :episodes)
        episodes = @anime['episodes']
        expect(episodes).to be_a_kind_of(Array)
      end
    end

    it "return result for manga endpoint" do
      VCR.use_cassette "raw manga" do
        @manga = @api.get(endpoint: 'manga', id: 15434)
        expect(@manga).to be_a_kind_of(Hash)
        expect(@manga['mal_id']).to eq 15434
      end
    end

    it "return result for character endpoint" do
      VCR.use_cassette "raw character" do
        @char = @api.get(endpoint: 'character', id: 32512)
        expect(@char).to be_a_kind_of(Hash)
        expect(@char['mal_id']).to eq 32512
      end
    end

    it "return result for person endpoint" do
      VCR.use_cassette "raw person" do
        @person = @api.get(endpoint: 'person', id: 2211)
        expect(@person).to be_a_kind_of(Hash)
        expect(@person['mal_id']).to eq 2211
      end
    end

    it "return result for search endpoint" do
      VCR.use_cassette "search anime" do
        @search = @api.get(endpoint: 'search', page: 1, flag: :anime, query: 'Railgun')
        expect(@search).to be_a_kind_of(Hash)
        expect(@search['results']).to be_a_kind_of(Array)
        expect(@search['results'][0].has_key? 'mal_id').to be true
      end
    end
    
    it "raise exception for invalid flag" do
      expect { @api.get(endpoint: 'anime', id: 34798, flag: :invalid) }
        .to raise_error(Jikan::FlagError)
      expect { @api.get(endpoint: 'search', page: 1, flag: :invalid, query: 'Yuru') }
        .to raise_error(Jikan::FlagError)  
    end

    it "raise exception for invalid request" do
      expect { @api.get(endpoint: 'anime', page: -1) }
        .to raise_error(Jikan::ClientError)
    end
  end
end