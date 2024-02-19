## Collected notes from previous upgrades

### Ruby on Rails

#### Rails 6 update (5.2.8.1 to 6.0.6):
- Make sure all raw sql (unsafe syntax) is wrapped in Arel.sql()
- Upgrade pg_seach: gem ‘pg_search’, ‘~> 2.1.4’ (safe query error)
- Add `config.active_record.yaml_column_permitted_classes = [Symbol, Date, BigDecimal, Time]`
- bin/rails zeitwerk:check (rails classic autoloader deprecated, not available in rails 7)
- Fix class naming conventions for autoload ie LoadCSV must be LoadCsv
- Skip precompile for asset helpers to public folder (handled by NGINX)
- Active support ActiveSupport::OrderedOptions does not save in cache (yaml doesn’t cache, convert to hash if used)
- Fix super class mismatch (migration classes and interaction class conflict if using same name)
- Old Savon version dependencies need to updated. Rails update seemed to overwrite Old Savon hash method (changed to #full_hash)
- Cancancan will no longer find_by slug by default, add find_by => :slug to controller statement
- URI::encode removed use -> URI::Parser.new.escape

#### Rails 6.1 update (6.0.6 to 6.1.7.6)
- Add require "nested_form/engine”/“nested_form/builder_mixin” to rails_admin initializer (feed parser)
- parent_class method (on ActiveRecord model) is removed (sso)
- ViewComponent ```render_component``` no longer necessary AND removed. Use plain ```render``` method.
- acts-as-taggable-on gem version must be >=7.0.0
- active_storage needs bundle exec rails active_storage:update and db migrations if using
- Check decimal column summing for decimal columns with no precision selected (adworks)

#### Rails 7.0 update (6.1.7.6 to 7.0.8)
- acts-as-taggable-on gem version must be >= 9.0
- Audited gem must be >= 5.0
- Devise gem must be >= 4.8.0
- Airbrake gem must be >= 13.0.3
- Disabling pooling in memcache (we use unicorn which is single-threaded), add pool: false to config.cache_store options
- Add config.active_support.cache_format_version = 6.1 to application.rb and remove when app stable on 7 (cannot rollback)
- button_to needs explicit method: :post (now defaults to :patch)
- Add sprocket-rails gem to Gemfile if using sprockets (no longer included in rails 7)
- .reorder().first deprecated. must use reorder().take
- errors.add(:type, msg) replaces deprecated errors[:type] << msg

### Ruby version updates

#### Ruby 3.0.6 Notes:
  - Options passed as hash to classes expecting keyword args must use double-splat ```**``` on param (ex. TagManager.new(**options) where options is a hash)
  - raw kernel open() must use actual class. IE File.open for files, URI.open for urls
  - Replace URI::encode/URI.encode/URI.escape with URI::Parser.new.escape
  - Add 'rexml' to Gemfile (no longer included in ruby and generally used by us IE rspec)
  - Add 'webrick' to Gemfile for development server (no longer included as default)
  - Use [kt-paperclip](https://github.com/kreeti/kt-paperclip) to replace paperclip
    - use notes here to use kt-paperclip for audio/video: https://github.com/ruby-av/paperclip-av-transcoder/issues/60
  - known minimum required gem versions:
    smarter_csv 1.2.8
    bootsnap 1.17.0
    delayed_job_active_record 4.1.8
    slack-notifier 2.4.0
    simple_form 5.1.0
