source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.1"

gem "bcrypt", "3.1.13"
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "3.4.1"
gem "config"
gem "faker", "2.1.2"
gem "figaro"
gem "i18n-js"
gem "jbuilder", "~> 2.7"
gem "kaminari"
gem "mysql2", "~> 0.5.3"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.4"
gem "rails-i18n"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "pry-rails", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "guard", "2.15.0"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem "pg", "1.1.4"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
