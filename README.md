# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version 2.7.2

* System dependencies 
  * gem rspec-rails
  * gem factory_bot_rails
  
* Configuration - this is a Rails 6 API only mode application 
    
* Database creation - Postgresql database you can use username:hometime and password:123456 to setup  the database

* How to run the test suite
  * Test suite i run with rspec command it will execute the tests for models, requests and services

* Deployment instructions
  * Setup the database and run migrations with rails db:setup and rails db:migrate

Remarks:

* System has one entry point that is the reservations controller which processes arrived params by using
ReservationBuilder service object which after parsing the payload checks weather it's AirBnb or Booking payload.
If it's unknown payload system will trigger a error message that it's Unknown Sender! This approach has been used
because it is very scalable and it's very easy to add parsing classes for new clients. 
* After params are parsed for either of the cases they come back to controller which if the reservation does not 
exist creates a new one or if it exists it updates the attributes (here for example we can notify company that 
reservation has changed for some client)
* Two models are used Guest and Reservation, guest has email as unique field and will find_or_create_guest for 
incoming reservations. Reservation has a code unique field so no reservations can be accepted with the same code,
if it's same reservations only changed attributes will be updated.
* You can use CURL to send payloads to test the application