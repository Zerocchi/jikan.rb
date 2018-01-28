# Jikan

This is a thin Ruby wrapper for [jikan.me](http://jikan.me) inspired heavily by [JikanPy](https://github.com/AWConant/jikanpy). This is pretty much work in progress and by any means not to be used in production. Documentation will be updated as the work progresses.

## Installation

**NOTE: This does not work yet until the gem is uploaded.**

Add this line to your application's Gemfile:

```ruby
gem 'jikan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jikan

## Usage

**Get anime and manga information based on their ID**

```ruby
# https://myanimelist.net/anime/34798/Yuru_Camp
>> yurucamp = Jikan::Query.anime_id 34798 # manga_id for manga
=> #<Jikan::Anime:0x0168c4e0>

>> yurucamp.raw
=> {
    "mal_id"=>34798,
    "link_canonical"=>"https://myanimelist.net/anime/34798/Yuru_Camp△",
    "title"=>"Yuru Camp△",
    "title_english"=>"Laid-Back Camp",
    "title_japanese"=>"ゆるキャン△",
    "title_synonyms"=>"Yurukyan, Laid-Back Camp△",
    ...
   }

>> yurucamp.title
=> "Yuru Camp△"

>> yurucamp.rating
=> "PG-13 - Teens 13 or older"
```

**Get character and people information based on their ID**

```ruby
# https://myanimelist.net/character/16521/Kagome_Ikaruga
>> ikaruga = Jikan::Query.character_id 16521
=> #<Jikan::Character:0x0134b080>

>> ikaruga.raw # only raw method is available for now for both character and people
=> {
    "mal_id"=>16521,
    "link_canonical"=>"https://myanimelist.net/character/16521/Kagome_Ikaruga",
    "name"=>"Kagome Ikaruga",
    "name_kanji"=>"(斑鳩かごめ)",
    "nicknames"=>"Kagome  Ikaruga",
    "about"=>
      "10 years old and the youngest of the Ikaruga sisters. She has bigger breast than Ayame so she covers them. She seems to like Masashi.",
    ...
  }
```

**Search**
``` ruby

>> railgun = Jikan::Query.search("railgun", :anime) # other parameter tokens are :manga, :character, :person
=> #<Jikan::Search:0x016fd760>

>> railgun.raw # only raw method is available for now
=> {"result"=>
    [
      { 
        "id"=>6213,
        "url"=>"https://myanimelist.net/anime/6213/Toaru_Kagaku_no_Railgun",
        "image_url"=>
        "https://myanimelist.cdn-dena.com/r/100x140/images/anime/8/53581.jpg?s=4003b92ef0e723389087b69a8a08d742",
        "title"=>"Toaru Kagaku no Railgun",
        ...
      },
      {
        "id"=>16049,
        "url"=>"https://myanimelist.net/anime/16049/Toaru_Kagaku_no_Railgun_S",
        "image_url"=>
        "https://myanimelist.cdn-dena.com/r/100x140/images/anime/7/75610.jpg?s=ca85d87b5ff134c73f03184d111604c0",
        "title"=>"Toaru Kagaku no Railgun S"
        ...
      }
    ]
  }
```

## To-Do
- [ ] Add test suites
- [X] Add search feature
- [X] Refactoring 
- [ ] Break down hashes into consumable classes

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Zerocchi/jikan.rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jikan project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Zerocchi/jikan/blob/master/CODE_OF_CONDUCT.md).
