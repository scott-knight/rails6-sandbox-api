source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# ------ SYSTEM ---------------------------
gem 'rails', '~> 6.0', '>= 6.0.3.3'
gem 'pg'
gem 'puma'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'bundler-audit'
gem 'discard'
gem 'hamlit' # for email layouts - https://github.com/k0kubun/hamlit
gem 'hamlit-rails'
gem 'humanize'
gem 'pagy' # https://github.com/ddnexus/pagy - fast pagination
gem 'rack-cors'


# Use Active Storage
gem 'active_storage_validations'
gem 'image_processing', '~> 1.2'
gem "aws-sdk-s3", require: false

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'


# ------ SERIALIZATION -------------------
gem 'fast_jsonapi'
gem 'oj'


# ------ AUTHENTICATION -------------------
gem 'devise'
gem 'devise-argon2' # https://github.com/erdostom/devise-argon2
gem 'devise-encryptable'
gem 'devise-jwt' # https://github.com/waiting-for-dev/devise-jwt


group :development do
  gem 'html2haml'
  gem 'letter_opener'
  gem 'listen'
  gem 'meta_request'
  gem 'solargraph'
  gem 'squasher'
end


group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'rspec-rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'timecop'
  gem 'webmock'
end


group :test do
  gem 'database_cleaner-active_record'
  gem 'shoulda-matchers'
  gem 'simplecov'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]