# Sinatra Content Management System App

## Overview

This is the first step in an app I am creating for sign language interpreting
referral agencies. As an interpreter I have seen the need for agencies to have
access to a schedule management system that is designed with their unique needs
in mind. I wanted to test out my knowledge of Sinatra and CRUD to create the
simplest piece of the app: creating a user (interpreter) and jobs.

##Using the App

Currently, the application is not hosted on a website. In order to run it, you must clone the
GitHub repo [here](https://github.com/marcnjaramillo/sinatra-assessment-app).
Once the repo has been cloned, run the command `bundle install` in your terminal
to make sure all the requisite gems are installed. Run the
command `shotgun` in your terminal to start up localhost, which should look
something like http://127.0.0.1:9393/. Now you can use the application to create
a user and create jobs!

When you are finished, enter `CTRL+C` in your terminal to stop your localhost.

*NOTE: Depending on the version of rack you have on your local machine, you may
need to run* `bundle exec shotgun` *to get your localhost running properly.*

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcnjaramillo/sinatra-assessment-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
