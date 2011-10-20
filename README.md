rubygems-source-cli ![travis-ci](https://secure.travis-ci.org/textgoeshere/rubygems-source-cli.png)
===================

This is a collection of dirty, dirty patches for `gem push` and `gem
yank`:

* When you do not supply an API key and you are not using
  `rubygems.org`, you are not prompted to sign into `rubygems.org`
* `gem yank` accepts `--host [HOST]` and `--key [KEY]` options

Usage
-----

API keys should be stored in YAML format in `$HOME/.gem/credentials`:

    ---
    :rubygems_api_key: 198dbad38sadasd87
    :another_key: 2897234987bsdb90834

Then specify `--host` and `--key` options when pushing/yanking:

    $ gem push mygem-1.0.0.gem --host https://example.com --key another_key
    $ gem yank mygem-1.0.0.gem --host https://example.com --key another_key

Install
-------

* `gem install rubygems-source-cli`

or add it to your `Gemfile`:

* `gem "rubygems-source-cli"`

Development
-----------

* Source hosted at [GitHub](https://github.com/kapoq/rubygems-source-cli)
* Report issues/Questions/Feature requests on [GitHub Issues](https://github.com/kapoq/rubygems-source-cli)
* CI at [Travis](http://travis-ci.org/#!/textgoeshere/rubygems-source-cli)

Pull requests are very welcome! Make sure your patches are well tested. Please create a topic branch for every separate change
you make.

### Testing ###

    $ rake

Related projects
----------------

* [rubygems-source](https://github.com/kapoq/rubygems-source): 
  remote source server for Rubygems that implements the core Rubygems gem source web API
* [rubygems-source-features](https://github.com/kapoq/rubygems-source-features):
  Cucumber features for Rubygems sources
* [rubygems.org](https://github.com/rubygems/rubygems.org): 
  Daddy
* [geminabox](https://github.com/cwninja/geminabox): 
  Very similar project, no `gem yank`, no tests of any kind
* [sinatra-rubygems](https://github.com/jnewland/sinatra-rubygems): 
  Replacement for `gem server` - no `gem push`, `gem yank` or resolver

Author
------

[Dave Nolan](https://github.com/textgoeshere)
