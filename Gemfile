source 'http://ruby.taobao.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.20'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bourbon', '~> 4.2.4'
gem 'bootstrap-sass', '~> 3.3.5.1'
gem 'font-awesome-rails', '~> 4.4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'slim-rails', '~> 3.0.1' # Provides the generator settings required for Rails 3 and 4 to use Slim

gem 'devise', '~> 3.5.2' # Flexible authentication solution for Rails with Warden
gem 'omniauth', '~> 1.2.2' # A generalized Rack framework for multiple-provider authentication.
gem 'omniauth-oauth2', '~> 1.3.1' # An abstract OAuth2 strategy for OmniAuth.
gem 'letter_opener', '~> 1.4.1' # Letter Opener will open a preview in the browser instead of sending.
gem 'cancan', '~> 1.6.10' # Simple authorization solution for Rails which is decoupled from user roles.
gem 'rolify', '~> 4.1.1' # Very simple Roles library
gem 'safe_yaml', '~> 1.0.4' # Parse YAML safely

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'annotate', '~> 2.6.10' # Annotates
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.3.3' # rspec-rails is a testing framework for Rails 3.x and 4.x.
  gem 'spork-rails', '~> 4.0.0' # Plugin for Spork to support Rails.
  gem 'guard-rspec', '~> 4.6.4' # Guard::RSpec automatically run your specs
  gem 'guard-spork', '~> 2.1.0' # Guard::Spork automatically manage Spork DRb servers.
  gem 'factory_girl_rails', '4.5.0' # provides integration between factory_girl and rails 3
  gem 'faker', '~> 1.5.0' # easily generate fake data
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'capybara', '~> 2.5.0' # Capybara is an integration testing tool for rack based web applications.
  gem 'cucumber-rails', '~> 1.4.2' # Cucumber Generator and Runtime for Rails
  gem 'database_cleaner', '~> 1.5.0' # ensure a clean state for testing.
end
