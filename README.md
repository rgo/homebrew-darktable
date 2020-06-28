# WIP - NOT WORKING YET (wait a little bit, it will be soon) :)

# homebrew-darktable

This is a 3rd party tap for [Darktable](http://darktable.org/). It provides a formula for darktable which includes Lua support.

Contents:

* [Installation and usage](#how-do-i-install-these-formulae)
* [Updating](#updating)
* [Issues](#issues)


## How do I install these formulae?

`brew install rgo/homebrew-darktable/darktable`

Or `brew tap rgo/homebrew-darktable` and then `brew install darktable`.

## I want to run darktable

After installing darktable you can open it by executing `darktable` from your terminal.

It's up to you to create a direct access or something similar.


### I already have it installed but I want to to test it

To avoid broken anyhting of your current installation. You can execute this darktable with the database in memory:

```
darktable --library :memory:
```


## Updating

To upgrade the formula to the most recent stable release:

```
brew update && brew upgrade homebrew-darktable/darktable/darktable
```

## Issues

To report issues, please [file an issue on GitHub](https://github.com/rgo/homebrew-darktable/issues).
Please note that we will only be able to help with issues that are exclusive to this tap.

If the problem is reproducible with the official darktable version, please file the issue [on their tracker](https://github.com/darktable-org/darktable/issues).
