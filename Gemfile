source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use postgresql as the database for Active Record
gem 'pg'

# EmberJS
gem 'active_model_serializers'
gem 'ember-rails'
gem 'ember-source'

# API Versioning
gem 'versionist'

# Authentication
gem 'devise'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.0.4'

# Unicorn server
gem 'unicorn'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
end

group :development, :test do
  gem 'therubyracer'
  gem 'rspec-rails', '3.0.0.beta2'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'minitest-reporters'
end

group :production do
  gem 'rails_12factor'
end