# Online Forum

A Web Application built on Ruby on Rails where user can post a question and add comments to the question and the other commnents also.

# Installation Steps

## Step 1 - Install prerequisites

Install Ruby-2.6.4

    $ rvm install 2.6.4

## Step 2 - Clone the Repository

    $ git clone https://github.com/bprateek10/online-forum.git
    $ cd online-forum

## Step 3 - Bundle

Run following commands on terminal in your root directory

    $ gem install bundler
    $ bundle install

## Step 4 - Create database

Create database.yml file in config folder and paste following into it with your porstgres credentials

    default: &default
      adapter: postgresql
      pool: 5
      username: #{YOUR POSTGRES USERNAME}
      password: #{YOUR POSTGRES PASSWORD}
      timeout: 5000

    test:
      <<: *default
      database: online_forum_test
      host: localhost
    development:
      <<: *default
      database: online_forum_development
      host: localhost
    production:
      <<: *default
      database: online_forum_development
      adapter: postgresql
      host: localhost
      pool: 5
      username: postgres
      password: postgres
      timeout: 5000

Save the changes.

Now in terminal run following commands

    $ rails db:create
    $ rails db:migrate
    $ rails db:seed

## Step 5 - Run rails server

You can run Rails server by running following command in terminal on root directory

    $ rails server

Now the application is running on http://localhost:3000.
You can use the credentials of the test user created in seed file
