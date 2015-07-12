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

#### Install gems and set database up

```
gem install foreman
bundle install
bin/rake db:setup
```

#### Start server and Resque workers

```
foreman start
```

This will start a server at http://localhost:3000.

To monitor the Resque workers, open http://localhost:3000/resque in a separate
tab.

![Resque web admin](https://cloud.githubusercontent.com/assets/338259/8618992/2e30d4a4-273d-11e5-8530-cc107344870b.jpg)


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

![Code snippet (no syntax highlighting)](https://cloud.githubusercontent.com/assets/338259/8618993/2e320306-273d-11e5-983c-eccfa927d416.jpg)

Once a worker finishes the job, you can refresh the page to see the
syntax highlighted version of the snippet.

![Code snippet (with syntax highlighting)](https://cloud.githubusercontent.com/assets/338259/8618994/2e346902-273d-11e5-9048-370ffc69909b.jpg)

## License

MIT
