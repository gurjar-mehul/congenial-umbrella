# README

Things you may want to cover:

* Ruby version
 ``` 2.5.1```

* Rails version
 `5.1.6`

* Configuration
```bash
rvm use .
gem install bundler
bundle install

cp config/database.yml.example config/database.yml
cp config/secrets.yml.example config/secrets.yml
```

* Database creation
 `rails db:create --trace`
 ` rails db:migrate --trace`

* Database initialization
 ` rails db:seed --trace`

* How to run the test suite
 ` rails db:create --trace RAILS_ENV='test'`
 ` rails db:migrate --trace RAILS_ENV='test'`
 ` rspec spec/controllers/api/v1/cars_controller_spec.rb -f d `
 ` rspec spec/models/track_spec.rb -f d `
