Ava
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application is designed to manage memberships for a student union.

The App contains a list of all members with respective memberships and rights. An API is availaible to explore data and
use it in another app.

This App is a currently a work in progress and should be a partial port of Adhesion the previous used app.

For Developers
-------------

This application requires:

- Ruby 2.2.1
- Rails 4.2.6

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------
To run this app, please first install a PostGres server with peer authentification and admin rights.

Run the following commands:

```bash
bundle install
rake db:create
rake db:migrate
rake db:seed
rails server start
```

All should be successful.

Documentation and Support
-------------------------
No documentation is availaible for that time, but you can contribute on the Wiki

Credits
-------
&copy; 2016 Philippe VIENNE

License
-------
[![GNU GPL v3.0](http://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl.html)

View official GNU site <http://www.gnu.org/licenses/gpl.html>.