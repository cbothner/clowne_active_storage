# clowne_active_storage

[![Gem](https://img.shields.io/gem/v/clowne_active_storage.svg)](https://rubygems.org/gems/clowne_active_storage)

[Clowne][] is a flexible gem for making deep clones of your models. It supports ActiveRecord associations out of the box, so the whole dependency graph can be copied. This gem adds support for ActiveStorage attachments so they can be cloned in the process.

[clowne]: https://github.com/palkan/clowne

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clowne_active_storage'
```

And then execute:

    $ bundle

## Usage

This gem adds one command to Clowne’s DSL: `include_attached`. You can use it like this:

```ruby
class PostCloner < Clowne::Cloner
  include_attached :cover_image, :files
end
```

`include_attached` can handle `has_one_attached` and `has_many_attached` ActiveStorage associations in the same command.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cbothner/clowne_active_storage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ClowneActiveStorage project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cbothner/clowne_active_storage/blob/master/CODE_OF_CONDUCT.md).
