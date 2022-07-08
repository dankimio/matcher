source 'https://rubygems.org'

ruby '~> 2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.0'
# Use Puma as the app server
gem 'puma', '~> 4.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Facebook Graph API
gem 'koala', '~> 2.4'
# Geolocation
gem 'geokit-rails', '~> 2.1'
# Apple Push Notifications
gem 'houston', '~> 2.2'
# Attachments
gem 'carrierwave', '~> 0.11.2'
# Image processing
gem 'mini_magick', '~> 4.5'

group :production do
  gem 'fog-aws', '~> 0.10.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Annotations
  gem 'annotate'
  # PRY console
  gem 'pry-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
