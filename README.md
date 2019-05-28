# ExportStrings

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'export_strings'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install export_strings

## Usage

```rb
require 'export_strings'

ExportString.execute rb_file_path

=> [String, String, String, String]
```


## Example

```rb
# =======example.rb=======
class Example
  def str1
    <<-SQL
      SELECT *
      FROM users
      WHERE id > 100
    SQL
  end

  def str2
    "I like gohan. Do you like gohan.Oh Yeah."
  end
end

# =======your irb console=======
require 'export_strings'

pp ExportStrings.execute 'example.rb'

["      SELECT *\n" + "      FROM users\n" + "      WHERE id > 100\n",
 "I like gohan. Do you like gohan.Oh Yeah."]

=> ["      SELECT *\n      FROM users\n      WHERE id > 100\n", "I like gohan. Do you like gohan.Oh Yeah."]

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Schedule

### I want to develop this to make gem of format or parce.

 - Implement to export from singleton_method
 - Implement to export from string interpolation
 - Implement to export from `hoge ? 'page' : 'peke'`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tashirosota/ruby-export_strings. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ExportStrings project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/export_strings/blob/master/CODE_OF_CONDUCT.md).
