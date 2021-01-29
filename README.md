# Iqdb::Client

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/iqdb/client`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iqdb-client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install iqdb-client

## Usage

```ruby

require 'iqdb/client'

iqdb_search = Iqdb::Client.new(service: Iqdb::Client::OFFICIAL_2D)
result = iqdb_search.from_link('https://iqdb.org/konachan/2/2/e/22e339719f511b89310291f2d5582ca1.jpg')

if result.success?
  puts "\n BEST MATCH:\n #{result.best_match.info}"
  puts "\n ADDITIONAL MATCHES:\n #{result.additional_matches.map(&:info).join("\n")}"
else
  puts "\n SUCCESS: FALSE"
  puts "\n POSSIBLE MATCHES:\n #{result.possible_matches.map(&:info).join("\n")}"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Odebe/iqdb-client.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
