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

```
$ git clone --branch v0.2.2 git@github.com:seancdavis/venti.git
$ cd venti
$ bundle install
```

### Database

There is a database.sample.yml file in your `config` directory. Copy or move
this to `config/database.yml` and add the appropriate configuration.

Then, get that databse setup:

```
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

### Start the Server!

Now you're ready to go. Just start that rails server:

```
$ bundle exec rails s
```

and head on over to [localhost:3000](http://localhost:3000) and add your
servers.

Settings / Configuration
---------------

Create your settings file by copying `config/settings.sample.json` to
`config/settings.json`. Change the values as appropriate.

By default, Venti will place it's exports in `lib/exports`. You can change this
and any other setting in `config/settings.json`.

### Interpolation

Interpolation of the settings file is preconfigured in the `replace_settings`
method in the `ApplicationHelper`. Add anything you want to these settings.

```ruby
def replace_settings
  {
    "root" => Rails.root,
    "home" => File.expand_path("~"),
  }
end
```

Then, you can interpolate strings in your settings file using `%{}`. So, for
example, you can get your root directory in the settings file with `%{root}`.

Import Existing Config File
---------------

You can get started by importing your existing config file. First, add the
location of this file in `config/settings.json`:

```json
"imports": {
  "file": "%{home}/.ssh/config"
}
```

---

Now, go have some fun. You can manually update every time you make a change by
clicking the button in the header, or you can configure a cronjob to do all that
hard work for you.

Contributing
---------------

I plan to add to this in the future. If you have a feature request, add an
issue, or write some code yourself.

Most of all, enjoy!
