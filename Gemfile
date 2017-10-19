source 'https://rubygems.org'

ruby '2.4.1'

gem 'rails'
gem 'pg'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'rails_12factor'
gem 'puma'
gem 'rails-i18n'
gem 'slim-rails'
gem 'draper'
gem 'simple_form'

group :production do
  gem 'newrelic_rpm'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'pry-byebug'
  gem 'pry'
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'quality'
  gem 'faker', git: 'git://github.com/stympy/faker.git', branch: 'master'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rcodetools'
  gem 'fastri'
  gem 'web-console'
  gem 'spring'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '3.3.7'
  gem 'rails-assets-noty'
end
