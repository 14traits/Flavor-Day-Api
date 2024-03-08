source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# gem "rails", "~> 7.0.6", ">= 7.0.5.1"
gem "rails", "~> 7.0.8.1"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.5.3"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.6.7"

# Job Scheduler:
gem 'whenever', :require => false

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"
gem "jb"

# Swagger
gem "rswag"

# dotevn gem for loading env file
gem "dotenv-rails"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "rswag-specs"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end


#fixing docker builds
gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
