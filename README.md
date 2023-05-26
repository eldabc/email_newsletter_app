# README

This guide includes the steps to configure and install your app in Rails.

Necessary things:

* Ruby version: 3.0.0

* Configuration: Once the repository has been cloned, run
    bundle install

* Database creation: 
    The app works with sqlite3 by default.

* Database initialization:
    Use the command
      rails:db create para crear la base de datos
      rails:db migrate para crear el esquema

* How to run the test suite:
    The app uses the rspec gem for testing execution:
     rspec spec to run all tests

* External Apps used:
    Sendgrind Api (api key value in rails credentials)
    Abstract Api (api_key in rails credentials)

* Commands to rails credentials: 

  rails credentials:help (for help)
  rails credentials:edit (for edit)
  rails credentials:edit --environment production

  EDITOR=nano rails credentials:edit --environment development (open to editor)

* To view local credentials configuration run:
    rails c 
    Entry: Rails.application.credentials.config

* Once the above instructions have been verified, run rails s 

* Go to http://127.0.0.1:3000/

 Enjoy! ;)

  