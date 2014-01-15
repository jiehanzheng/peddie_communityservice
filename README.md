peddie_communityservice
=======================

Community service day activity signup system for The Peddie School in Hightstown, NJ.

![Homepage](https://static.jiehan.org/pub/peddie_communityservice/screenshots/csday_signup_home.png)

![Signup page](https://static.jiehan.org/pub/peddie_communityservice/screenshots/csday_signup_committee_show.png)

Installation
------------

Check out this project with Git, create `config/database.yml`, and finally create `config/initializers/secret_token.rb` with this template:

```ruby
# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
PeddieCommunityservice::Application.config.secret_key_base = '<RUN rake secret AND PASTE IN THE RESULT>'
```

Configuration
-------------

Define a list of committees and shifts in [db/seeds.rb](https://github.com/jiehanzheng/peddie_communityservice/blob/master/db/seeds.rb).

Define signup policies in [config/settings.yml](https://github.com/jiehanzheng/peddie_communityservice/blob/master/config/settings.yml).

Exporting
---------

All signed-in users may visit `/committees.xls` to download an Excel sheet (legacy XML format) that contains all the signups grouped by shifts.
