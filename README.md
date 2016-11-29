# Sinatra Content Management System App

## Overview

This is the first step in an app I am creating for sign language interpreting
referral agencies. As an interpreter I have seen the need for agencies to have
access to a schedule management system that is designed with their unique needs
in mind. I wanted to test out my knowledge of Sinatra and CRUD to create the
simplest piece of the app: creating a user (interpreter) and jobs.

##Using the App

Currently, the application is not hosted. In order to run it, you must clone the
GitHub repo [here](https://github.com/marcnjaramillo/sinatra-assessment-app).
Once the repo has been cloned, run the command `bundle install` in your terminal
to make sure all the requisite gems are installed. To use the app, run the
command `shotgun` in the terminal to start up `localhost:9393`, or
http://127.0.0.1:9393/. Now you can use the application to create a user and
create jobs.

*NOTE: Depending on the version of rack you have on your local machine, you may
need to run* `bundle exec shotgun` *to get your localhost running properly.*

When you are finished, enter `CTRL+C` to stop your localhost.
