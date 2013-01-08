source 'http://rubygems.org'

gem 'rails', '3.2.9'

group :development, :test do
  gem 'sqlite3'

end
group :production do
  gem 'mysql2'
end

gem 'json'

#gem 'mandrill-api'

# bundle install --without production

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # Required for therubyracer
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'libv8', '~> 3.11.8.4'  # Update version number as needed
  gem 'therubyracer', '~> 0.11.0', :platforms => :ruby, :require => 'v8'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
gem "bcrypt-ruby", :require => "bcrypt"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem 'execjs'

gem "friendly_id"