RSpec.describe Jikan do
  it "has a version number" do
    expect(Jikan::VERSION).not_to be nil
  end

  it "has correct url" do
    expect(Jikan::BASE_URL).to eq "http://api.jikan.me"
    expect(Jikan::BASE_URL_SSL).to eq "https://api.jikan.me"
  end
end
