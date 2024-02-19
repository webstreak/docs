## Updating Ruby on Rails versions

The general advice here applies to us: [Upgrading Ruby on Rails](https://edgeguides.rubyonrails.org/upgrading_ruby_on_rails.html)

### Suggested step-by-step:
1. Update Gemfile to reflect new version of Ruby on Rails. This will likely necessitate other gem updates to account for new functionality in rails, especially as it relates to active record. View CHANGELOG/HISTORY.md or release pages for gems.
2. Run test suite and update code/specs where errors occur
3. Run ```bundle exec rails app:update``` and use diff to update the configuration files and rails binaries.
4. This task will generate a file under config/initializers title ```new_framework_defaults_VERSION.rb``` that will lay out new defaults/config options for the version you are updating to. Its best to test these options one by one, running specs as you go, and testing in staging when possible.
5. When the application is stable in production and you've tested these new options/defaults you can update the configuration in config/application.rb ```load_defaults VERSION``` to the updated version and delete the aforementioned ```new_framework_defaults_VERSION.rb``` initializer.
