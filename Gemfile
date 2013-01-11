source 'http://rubygems.org'

gem 'rails', '3.2.11'

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

  gem "execjs", "1.4.0"

  # Temporary workaround for libv8 issues on x86_64 linux
  case (RUBY_PLATFORM)
    when ('x86_64-linux')
      gem "therubyracer", "0.10.2"
    when ('i686-darwin12.2.0')
      gem "therubyracer", "0.11.1"
    end

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
gem "bcrypt-ruby", :require => "bcrypt"

gem 'newrelic_rpm'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem "friendly_id"