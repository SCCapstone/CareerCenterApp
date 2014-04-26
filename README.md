Career Center Companion
=================
The career center companion is an easy to use application that will house all information about a given career fair.

Producition App
===============
https://careercenterapp.herokuapp.com/

To Run
======
Downlaod and install Ruby. Download the application, run `bundle install` and make sure this command finishes without error. 

The application will be looking for a `.env` file. This file is expected to contain the following:
```
RACK_ENV=development
DB_UN= ***
DB_PW= ***
```
The database username and password are dependent on where you setup your database. To change the location of the database update the `database.yml` to specify the location of your development database.

To start the application on OS X run, `foreman start`. To start on Windows run, `thin start`.

To deploy, set up the application on heroku and run `git push heroku master`.
