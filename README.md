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

ExportStrings.execute rb_file_path

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

## Schedule

### I want to develop this to make gem of format or parce.

 - Implement to export from singleton_method
 - Implement to export from string interpolation
 - Implement to export from `hoge ? 'page' : 'peke'`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tashirosota/ruby-export_strings. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
