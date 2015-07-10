# rails-resque-code-snippets

A Rails app that manages a library of code snippets and uses Resque workers to
apply syntax highlighting.

Based on the tutorial found at http://railscasts.com/episodes/271-resque.

## How to use

#### Clone the repo

```
git clone git@github.com:thinkswan/rails-resque-code-snippets.git
```

#### Install Redis

If you're using Homebrew:

```
brew install redis
redis-server /usr/local/etc/redis.conf
```

If you prefer to install from source:

* http://redis.io/download#installation

#### Install gems and set project up

```
bundle install
bin/rake db:setup
```

#### Start server and Resque workers

```
bin/rails server
TERM_CHILD=1 QUEUE=* bin/rake resque:work
```

This will start a server at http://localhost:3000.

To monitor the Resque workers, open http://localhost:3000/resque in a separate
tab. (User Name: `<leave blank>`, Password: `password`)

![Resque web admin](https://cloud.githubusercontent.com/assets/338259/8615398/6860eea0-271c-11e5-868e-d5d8d44c4127.jpg)

## How it works

The Rails app is a basic CRUD application that allows you to manage code
snippets. It is backed by an SQLite3 database.

When you create or modify a snippet, a Resque worker (`SnippetHighlighter`) is
enqueued. This worker sends the code snippet and specified language to a [public
syntax highlighting API](http://markup.su/highlighter/api) and saves the result
when finished.

Note that when you first create or modify a snippet, you will see the plain
code when the request completes. This is because the syntax highlighting job has
not been picked off the queue yet.

![Code snippet (no syntax highlighting)](https://cloud.githubusercontent.com/assets/338259/8615397/68118d4c-271c-11e5-8845-a97b7f3e917d.jpg)

Once the Resque worker finishes the job, you can refresh the page to see the
syntax highlighted version of the snippet.

![Code snippet (with syntax highlighting)](https://cloud.githubusercontent.com/assets/338259/8615399/68648434-271c-11e5-904b-97bb1c315ed0.jpg)

## License

MIT
