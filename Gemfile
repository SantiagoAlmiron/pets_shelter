source 'https://rubygems.org'

ruby '3.0.6'
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'activestorage-cloudinary-service'
gem 'autoprefixer-rails'
gem 'bootstrap', '~> 5.3'
gem 'cloudinary'
gem 'devise'
gem 'font-awesome-sass', '~> 6.1'
gem 'haml-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'mini_magick'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'pundit', '~> 2.5'
gem 'rails', '~> 7.1.5', '>= 7.1.5.1'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '>= 4.0.1'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'
gem 'sassc-rails'
gem 'simple_form', github: 'heartcombo/simple_form'
gem 'stimulus-rails'
gem 'turbo-rails'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

group :development, :test do
  gem 'dotenv-rails'
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rspec-rails', '~> 7.0', require: false
  gem 'rubocop-rspec', require: false
  gem 'html2haml', require: false

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'rails-controller-testing'
end
