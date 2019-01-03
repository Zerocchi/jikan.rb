# Jikan.rb

[![Build Status](https://img.shields.io/travis/Zerocchi/jikan.rb.svg)](https://github.com/Zerocchi/jikan.rb/tree/master) [![Gem Version](https://img.shields.io/gem/v/jikan.rb.svg)](https://rubygems.org/gems/jikan.rb) [![Total Downloads](https://img.shields.io/gem/dt/jikan.rb.svg?colorB=6495ed)](https://rubygems.org/gems/jikan.rb) [![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/mit-license.php) [![Dart](https://img.shields.io/badge/language-Ruby-red.svg)](https://www.ruby-lang.org/)

This is a thin Ruby wrapper for [jikan.me](http://jikan.me) inspired by [JikanPy](https://github.com/AWConant/jikanpy).  For more information, please refer to [Jikan.ME documentation](https://jikan.me/docs).

**NOTE: Jikan API changed their base URL to *api.jikan.moe*. Old endpoints will continue to work until May 12th, 2018  ([Announcement](https://jikan.docs.apiary.io/) | [Issue #1](https://github.com/Zerocchi/jikan.rb/issues/1)) so it's strongly suggested that you update the gem to latest version.**

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

```diff
- NOTE: As per documentation there's a rate limit of 2000 requests per IP per day, and two concurrent requests 
- per second. This wrapper does not have any attempt of blocking the limit so please use it wisely. 
- More information available at https://jikan.docs.apiary.io/#introduction/information
```

**Get anime and manga information based on their ID**

```ruby
# https://myanimelist.net/anime/34798/Yuru_Camp
>> qry = Jikan::Query.new
=> <Jikan::Query:0x026ed9d0>

>> yurucamp = qry.anime_id 34798 # manga_id for manga
>> yurucamp = Jikan::anime 34798 # shortcut method without instaniating Query object, both are valid
# You can also specify flag as second parameter to get more information
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
=> <Jikan::Query:0x027554b8>

>> ikaruga = qry.character_id 16521
=> <Jikan::Character:0x0134b080>

>> ikaruga.raw # only raw method is available for now for both character and person
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

# as of v0.0.6 you can use Person and Character object methods
>> ikaruga.name
=> "Kagome Ikaruga"
```

**Search**
``` ruby
>> qry = Jikan::Query.new
=> <Jikan::Query:0x027d70e8>

>> railgun = qry.search("railgun", :anime) # other flags are :manga, :character, :person
=> <Jikan::Search:0x016fd760>

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

# Return each result items wrapped in their respective object 
# :person and :character only return raw objects for now so this method isn't available for those flags
>> res = railgun.result 
=> [<Jikan::Anime:0x0196c968>, <Jikan::Anime:0x0196c950>, <Jikan::Anime:0x019f1610>, <Jikan::Anime:0x019f15f8>, ...]

>> first_anime = res[0]
=> <Jikan::Anime:0x0196c968>

>> first_anime.title
=> "Toaru Kagaku no Railgun"

# Method name follow Jikan::Anime object so it will slighly differ from raw result keys
# e.g. raw result key is image_url but Jikan::Anime method is image.
>> first_anime.image
=> "https://myanimelist.cdn-dena.com/r/100x140/images/anime/8/53581.jpg?s=4003b92ef0e723389087b69a8a08d742"

>> first_anime.synopsis # same goes to description which is truncated in search result. We use synopsis method instead.
=> "The student-filled Academy City is at the forefront of scientific advancement and home to the esper 
development program. The seven \"Level 5\" espers are the most powerful in Academy City, and ranked th..."

# Eventhough the result method return specific objects array, it is still bound to the raw result above.
# So you don't get full information the same way when you do Jikan::anime(id)
>> first_anime.opening # this will return nil because search result doesn't have opening information
=> nil

# To get detailed anime information you can assign special details method on search result object.
# This method will call Jikan::Anime(id) or equivalent and get detailed information from the API and return new object.
# You can also pass flag as you would do in normal Query or shortcut methods.
>> full_info = first_anime.details
=> <Jikan::Anime:0x01ad4170>

>> full_info.opening
>> first_anime.details.opening # shorter way but this will call the API again if you change the rightmost method
=> ["#1: \"only my railgun\" by fripSide (eps 2-14)", "#2: \"LEVEL 5 -judgelight-\" by fripSide (eps 15-23)"]

```

## RESTv3 Features
- [X] Anime
- [X] Manga
- [X] Person
- [X] Character
- [X] Search
  - [ ] Advanced Search
- [X] Season
- [ ] User
  - [X] Profile
  - [ ] Animelist <sup>raw</sup>
  - [ ] Mangalist <sup>raw</sup>
  - [ ] History <sup>raw</sup>
  - [ ] Friends <sup>raw</sup>
- [X] Club
- [ ] Schedule
- [ ] Top
- [ ] Genre
- [ ] Producer
- [ ] Magazine

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
