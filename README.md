# Jikan.rb

[![Gem Version](https://img.shields.io/gem/v/jikan.rb.svg)](https://rubygems.org/gems/jikan.rb) [![Total Downloads](https://img.shields.io/gem/dt/jikan.rb.svg?colorB=6495ed)](https://rubygems.org/gems/jikan.rb) [![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/mit-license.php) [![Dart](https://img.shields.io/badge/language-Ruby-red.svg)](https://www.ruby-lang.org/)

This is a thin Ruby wrapper for [jikan.me](http://jikan.me) inspired by [JikanPy](https://github.com/AWConant/jikanpy).  For more information, please refer to [Jikan.ME documentation](https://jikan.me/docs).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jikan.rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jikan.rb

## Usage

**Get anime and manga information based on their ID**

```ruby
# https://myanimelist.net/anime/34798/Yuru_Camp
>> qry = Jikan::Query.new
=> #<Jikan::Query:0x026ed9d0>

>> yurucamp = qry.anime_id 34798 # manga_id for manga
# You can also specify flag as second parameter
# >> yurucamp = qry.anime_id 34798, :episodes
# All flags are symbol, please refer https://jikan.me/docs#chaining-methods to see all available flags
=> <Jikan::Anime:0x0168c4e0>

>> yurucamp.raw
=>{
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
>> qry = Jikan::Query.new
=> #<Jikan::Query:0x027554b8>

>> ikaruga = qry.character_id 16521
=> #<Jikan::Character:0x0134b080>

>> ikaruga.raw # only raw method is available for now for both character and people
=>{
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
>> qry = Jikan::Query.new
=> #<Jikan::Query:0x027d70e8>

>> railgun = qry.search("railgun", :anime) # other parameter tokens are :manga, :character, :person
=> #<Jikan::Search:0x016fd760>

>> railgun.raw # return raw result
=>{"result"=>
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

>> res = railgun.result # return each result items wrapped in Jikan::Anime object
=> [#<Jikan::Anime:0x0196c968, #<Jikan::Anime:0x0196c950, #<Jikan::Anime:0x019f1610, #<Jikan::Anime:0x019f15f8
...]

>> res[0].title
=> "Toaru Kagaku no Railgun"

>> res[0].image # method name follow Jikan::Anime object so it will slighly differ from raw result keys e.g. raw result key is image_url but Jikan::Anime method is image.
=> "https://myanimelist.cdn-dena.com/r/100x140/images/anime/8/53581.jpg?s=4003b92ef0e723389087b69a8a08d742"

>> res[0].synopsis # same goes to description which is truncated in search result. We use synopsis method instead.
=> "The student-filled Academy City is at the forefront of scientific advancement and home to the esper development program. The seven \"Level 5\" espers are the most powerful in Academy City, and ranked th..."

```

## To-Do
- [X] Add test suites
- [X] Add search feature
- [ ] Refactoring 
- [X] Break down hashes into consumable classes

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Zerocchi/jikan.rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jikan project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Zerocchi/jikan/blob/master/CODE_OF_CONDUCT.md).
