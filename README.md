# capistrano-simple-shared-files

This gem provides Capistrano recipes to upload your linked files and directories. Linked files and directories are placed in the `shared` directory on your remote servers and kept between deployments. After a new deployment, a symlink is created from the `shared` directory to the `current` directory.

This is an adaptation from runar's [capistrano-linked-files](https://github.com/runar/capistrano-linked-files) which is inspired in damselem's [capistrano-shared-files](https://github.com/damselem/capistrano-shared-file). This gem applies the philosophy of the second one with the simpler, easier code of the first.

## Installation

Add the gem to your `Gemfile`:

```ruby
gem 'capistrano-simple-shared-files'
```

Or install it to your system:

```
$ gem install apistrano-simple-shared-files
```

## Usage

Add the gem to your `Capfile`:

```ruby
require 'capistrano/simple_shared_files'
```

In `deploy.rb`, list the files and directories you'd like to keep between deployments:

```ruby
set :shared_files, %w(config/database.yml config/secrets.yml)
set :shared_dirs, %w(bin tmp)
```

Then run the task:

```
$ bundle exec cap <stage> simple_shared_files:upload
```

To automatically upload linked files and directories before a new deployment, add the following to your `deploy.rb`:

```ruby
before 'deploy:starting', 'simple_shared_files:upload'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The capistrano-linked-files plugin is free software released under the MIT License.
See [LICENSE](https://github.com/runar/capistrano-linked-files/blob/master/LICENSE) for details.
