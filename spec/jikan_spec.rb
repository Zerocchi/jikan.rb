RSpec.describe Jikan do
  it "has a version number" do
    expect(Jikan::VERSION).not_to be nil
  end

  it "has correct url" do
    expect(Jikan::BASE_URL).to eq "http://api.jikan.moe"
    expect(Jikan::BASE_URL_SSL).to eq "https://api.jikan.moe"
  end

  describe ".anime" do
    it "return Anime object" do
      VCR.use_cassette "raw anime" do
        @anime = Jikan::anime 34798
        expect(@anime).to be_a_kind_of(Jikan::Anime)
      end
    end
  end

  describe ".manga" do
    it "return manga object and type" do
      VCR.use_cassette "raw manga" do
        @manga = Jikan::manga 15434
        expect(@manga).to be_a_kind_of(Jikan::Manga)
        expect(@manga.type).to eq "Manga"
      end
    end
  end

  describe ".character" do
    it "return character raw result" do
      VCR.use_cassette "raw character" do
        @character = Jikan::character 32512
        expect(@character.raw).to be_a_kind_of Hash
        expect(@character.raw['mal_id']).to eq 32512
        expect(@character.raw['name']).to eq "Violate Behemoth"
      end
    end
  end

  describe ".person" do
    it "return person raw result" do
      VCR.use_cassette "raw person" do
        @person = Jikan::person 2211
        expect(@person.raw).to be_a_kind_of Hash
        expect(@person.raw['mal_id']).to eq 2211
        expect(@person.raw['name']).to eq "Makoto Tateno"
      end
    end
  end

  describe ".search" do
    it "return anime search result" do
      VCR.use_cassette "search anime" do
        @anime_search = Jikan::search("Railgun", :anime)
        expect(@anime_search.raw).to be_a_kind_of Hash
        expect(@anime_search.raw["result"]).to be_a_kind_of Array
        expect(@anime_search.raw["result"][0].has_key? "mal_id").to be true
      end
    end
  end
end
