source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.16'

gem 'jquery-rails'
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'foundation-rails'
gem 'rolify'
gem 'simple_form'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'sqlite3'
    gem 'sass-rails',   '~> 3.2.3'
    gem 'coffee-rails', '~> 3.2.1'
    gem 'uglifier', '>= 1.0.3'
end
group :assets do
end
group :production do
  gem 'thin'
  gem 'rails_12factor'
  gem 'pg'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'selenium-webdriver'
end
