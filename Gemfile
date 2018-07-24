source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "5.2.0"
gem "puma", "3.12.0"
gem "sass-rails", "5.0.7"
gem "uglifier", "4.1.16"
gem "coffee-rails", "4.2.2"
gem "turbolinks", "5.1.1"
gem "jbuilder", "2.7.0"
gem "bootsnap", "1.3.1", require: false

group :development, :test do
  gem "mysql2", "0.5.2"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", "3.6.2"
  gem "listen", "3.1.5"
  gem "spring"
  gem "spring-watcher-listen", "2.0.1"
end

group :test do
  gem "capybara", "3.4.1"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
