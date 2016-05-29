# Cuckoo API

This is a simple appointments and scheduler API leveraging Rails 5 new API module

It uses Rails 5.0 beta and ruby 2.3.0

All usual CRUD functionalities are implemented through a json API

This app uses a services-based architecture, each action(beyond the basics of a CRUD API) utilize a service(located under the app/services folder) to accomplish an action.

This has been tested using Rails default Minitest/Test::Unit, to run tests: `rails test`

All the endpoints can be accessed via a demo app located at: `https://cuckoo-api.herokuapp.com/`

To update a schedule time attribute(aka time of day which all of its appointments should schedule) use time formatted strings(`14:00`), they are then converted to integers corresponding to the amount of seconds.
