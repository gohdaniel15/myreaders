source 'https://rubygems.org'

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.7'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

# Web server built for concurrency
gem 'puma'

# Use SCSS for stylesheets
gem 'sassc-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Templating engine
gem 'slim-rails'

# Front end framework
gem 'bootstrap-sass'

# Simple DSL for declaring JSON structures
gem 'jbuilder', '~> 2.0'

# Provides easy form for rails
gem 'simple_form'
gem 'cocoon'

# Enabling datetime picker for forms
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.42'

# HTML template for Ruby Code
gem 'sdoc', '~> 0.4.0', group: :doc

# Configurable tool for analyzing Slim templates
gem 'slim_lint', require: false

# Configurable tool for writing clean and consistent SCSS
gem 'scss_lint', require: false

# Flexible authentication solution for Rails with Warden
gem 'devise'

# An invitation strategy for devise
gem 'devise_invitable'

# To add symbolic fonts
gem 'font-awesome-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Load environment variables from .env into ENV in development
  gem 'dotenv-rails'

  # Testing framework
  gem 'rspec-rails', '~> 3.5'

  # Copies an initializer to every rails project
  gem 'pry-rails'

  # Test fixtures
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Static code analysis
  gem 'rubocop', require: false

  # Mutes assets pipeline log messages.
  gem 'quiet_assets'
end

group :test do
  # Code coverage
  gem 'simplecov', require: false

  # Automated code review
  gem 'codeclimate-test-reporter'

  # One-liner RSpec helper
  gem 'shoulda-matchers'
end

group :production, :staging do
  # Makes app Twelve-factor app
  gem 'rails_12factor'
end
