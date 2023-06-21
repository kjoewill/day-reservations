# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.1.4

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* .............

## Setting up a test environment
1. Create a new folder
2. cd to new folder
3. git clone https://github.com/kjoewill/day-reservations
4. git checkout v0.1.0
5. bundle install
6. rails test:system

## Setting up a new development environment
1. Create a new folder
2. cd to new folder
3. git init
4. git remote add origin https://github.com/kjoewill/day-reservations
5. git fetch origin
6. git checkout main 
7. bundle install

## The current Pipleine flow
1. Make a change in a local repository
2. Test the change locally
3. Push the change to GitHub 
4. Ensure the GitHub CI Action successfully runs System Tests
5. Ensure the Heroku pipeline (res-pipline "tests" tab) pulled the new version and succefully ran system tests
6. Deploy the new version to the staging app in the pipeline and perform exploratory testing
7. Push the "promote" button on the staging app representation to move the "slug" to production