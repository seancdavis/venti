Venti
===============

The SSH config file is a great thing -- no memorizing IP addresses, users,
ports, etc. -- until it's gets long. It can very quickly become a pain to know
what is in your config and what isn't. And, if you're like me, you're accessing
servers belonging to different accounts or companies, and it's nice to keep
those somewhat separated.

Venti is a Ruby on Rails application for helping you organize your SSH server
config file.

This README walks through how to get Venti up and running locally (i.e. in
development). She's brand new, though -- as features are added, documentation
will be expanded upon. Soon I'll share some documentation of deploying to a
server and automating all this nonsense.

Getting Started
---------------

Setup this Rails app just like you would any other Rails app.

```bash
$ git clone --branch v0.1 git@github.com:seancdavis/venti.git
$ cd venti
$ bundle install
```

### Database

There is a database.sample.yml file in your `config` directory. Copy or move
this to `config/database.yml` and add the appropriate configuration.

Then, get that databse setup:

```bash
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

### Start the Server!

Now you're ready to go. Just start that rails server:

```bash
$ bundle exec rails s
```

and head on over to [localhost:3000](http://localhost:3000) and add your
servers.

Settings / Configuration
---------------

By default, Venti will place it's exports in `lib/exports`. You can change this
and any other setting in `config/initializers/_settings.rb`.

---

Now, go have some fun. You can manually update every time you make a change by
clicking the button in the header, or you can configure a cronjob to do all the
hard work for you.

Contributing
---------------

This was a quick build for me, but it was a fun exercise. I plan to add to this
in the future. However, if you have a feature request, add an issue, or write
some code yourself.

Most of all, enjoy!
