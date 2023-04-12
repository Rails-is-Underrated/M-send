source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data"
gem "bootsnap", require: false
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'dotenv-rails'
end
group :development do
  gem 'letter_opener_web', '~> 2.0'
  gem "letter_opener"
end
gem 'jwt'
gem 'rack-cors'
