source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem "font-awesome-rails", "~> 4.5.0"
gem 'foundation-rails'
gem 'delayed_job_active_record'
gem "daemons"
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'activemerchant'

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'pry'
gem "paperclip", "~> 4.3"
gem 'simple_calendar'

gem 'aws-sdk', '< 2.0'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "factory_girl_rails"
  gem "faker"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Use postgresql as the database for Active Records
  gem 'pg'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'unicorn'
  # gem 'mysql'
  gem 'rails_12factor'
  gem 'pg'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'database_cleaner'
end

