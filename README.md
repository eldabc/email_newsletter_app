# README

Esta guia incluye los pasos para realizar la configuracion e instalacion de su app en Rails]]

Cosas necesarios:

* Ruby version: 3.0.0

* Configuration: Una vez clonado el repositorio ejecutar bundle install

* Database creation: 
    La app funciona con sqlite3 por defecto.

* Database initialization:
    Emplear el comando rails:db migrate para crear la base de datos

* How to run the test suite:
    La app usa la gema rspec para la ejecucion de testing ejecutar rspec spec para ejecutar todos los test  

* External Apps used:
    Api de sendgrind (api key value located in rails credentials)
    Api Abstract

* Commands: 

  rails credentials:help
  rails credentials:edit
  rails credentials:edit --environment production

  EDITOR=nano rails credentials:edit --environment development

* Para ver configuracion de credenciales locales run:
    rails c 
    Escriba: Rails.application.credentials.config

  