# List Creator Backend

## Description

This is the backend for the List Creator app. In here you will find the models and controllers for the frontend.

### Installation Instructions

Fork and clone this repository and then run bundle install to install all of the gems. Then run bundle exec rake db:migrate to create the migrations.Finally run bundle exec rake db:seed to plant all of the seed data.
To stat the server run: $ bundle exec rake server

### Architecture and Models

There are two models, they are list and task. A List has many Tasks and a Task belongs to one List. In the ApplicationController you will find a list of routes for CRUD requests.

### Front End Link

For the front end visit [List Creator Front End](https://github.com/TylerLampel/phase-3-app-front-end)
