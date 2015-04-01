# Octocam

Octocam generate simple CHANGELOG with Markdown from GitHub pull requests.

## Installation

    $ gem install octocam

### GitHub Token

If you want to generate CHANGELOG from private repo, set OCTOCAM_GITHUB_TOKEN to your environment variable.

**You can easily [generate it here](https://github.com/settings/applications)**.

Then, add to your `~/.bash_profile` or `~/.zshrc` or any other place to load ENV variables string.

```
export OCTOCAM_GITHUB_TOKEN="your-40-digit-github-token"
```

## Usage

```
octocam -o zephiransas -r octocam -f 2015-01-01 -t 2015-01-31
```

```
-o  (required) owner of the GitHub repository
-r  (required) name of the GitHub repository
-f  (required) start of merged at
-t  (required) end of merged at
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/zephiransas/octocam/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
