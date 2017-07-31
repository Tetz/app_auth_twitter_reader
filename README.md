# AppAuthTwitterReader

Download user timelines from twitter api. The output format is csv. User timelines includes


tweets by the user.
retweets by the user.
Currently, the maximum number of tweets you can get is limited to less than 3200 due to the API limitation. (See https://dev.twitter.com/rest/reference/get/statuses/user_timeline)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'app_auth_twitter_reader',  :github => 'toshiya/app_auth_twitter_reader'
```

And then execute:

    $ bundle

## Usage

# Requirement

 * Ruby > 2.1.0

# Get twitter api key and secret

The script use application only authentication.
Register as a twitter developer and get api key and secret.

[Twitter Application Management Console](https://apps.twitter.com/)

# Usage

Assume that your key and secret is written in `./api_key` and `./api_secret`.

```bash

# help
bundle exec app_auth_twitter_reader  --help

# get access token (only once)
bundle exec app_auth_twitter_reader  --key=`cat ./api_key` --secret=`cat ./api_secret` > ./access_token

# get user timeline using the access token.
bundle exec app_auth_twitter_reader --token=`cat ./access_token` --screen_name twitter

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/app_auth_twitter_reader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

