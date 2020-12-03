**DISCLAIMER:** This darktable version is most probably NOT ready for production. With the time, when we(among all) polish the build, it could be.

To avoid database incompatibilities when you're testing master or HEAD versions [execute darktable database in memory](#i-already-have-it-installed-but-i-want-to-to-test-it) (read below).


# homebrew-darktable

This is a 3rd party tap for [Darktable](http://darktable.org/). It provides a formula for darktable which includes Lua support.

Contents:

* [Installation and usage](#how-do-i-install-these-formulae)
* [Updating](#updating)
* [Issues](#issues)


## How do I install these formulae?

`brew install rgo/homebrew-darktable/darktable`

Or `brew tap rgo/homebrew-darktable` and then `brew install darktable`.



### I want to try new devevelopments/features from master branch

First of all, unlink your current darktable version installed: `brew unlink darktable`

Now, you're ready to install latest master version `brew install darktable --HEAD`


#### I'm really brave and I want to try features from other developers!

You can change head to point to a different repository simply editing the formula.
All you need is to execute `brew edit darktable`

It will open the formula, and just before the `depends_on` section you will find `head`.
Then, you only have to replace it with the repository and branch you want to try.

Example:

```
  # head "https://github.com/darktable-org/darktable.git" # ORIGINAL LINE COMMENTED
  head "https://github.com/foobar/darktable.git", :branch => "cool_feature_to_test"
```
_NOTE:_ I prefer comment original line than delete it.

Save your changes and `brew install darktable --HEAD`

If you already have darktable head installed then you have to do a `brew reinstall darktable`

##### I was really brave but I want to restore the original formula

As you wish, `brew update-reset` will restore **all** your formulas to pristine status.




## I want to run darktable

After installing darktable you can open it by executing `darktable` from your terminal.

It's up to you to create a direct access or something similar.


### I already have darktable installed, I ONLY want to to test it

To avoid break anyhting of your current installation, you can execute this darktable with the database in memory, custom cache directory and a separate configuration path:

```
darktable --library :memory: --cachedir /tmp/homebrew-darktable-head-cache/ --configdir ~/.config/homebrew-darktable-head
```


## Updating

### Darktable

To upgrade darktable you should execute `brew upgrade darktable`

It takes into account if you are using master or stable version and only updates that version.


### Formula

To upgrade the formula to the most recent stable release, as usual: `brew update`


## Issues

To report issues, please [file an issue on GitHub](https://github.com/rgo/homebrew-darktable/issues).
Please note that we will only be able to help with issues that are exclusive to this tap.

If the problem is reproducible with the official darktable version, please file the issue [on their tracker](https://github.com/darktable-org/darktable/issues).
