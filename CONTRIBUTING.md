# Contributing

We ♥ contributors! By participating in this project, you agree to abide by the
Ruby for Good [Code of Conduct](CODE_OF_CONDUCT.md).

**First:** if you're unsure or afraid of *anything*, just ask or submit the
issue or pull request anyways. You won't be yelled at for giving your best
effort. The worst that can happen is that you'll be politely asked to change
something. We appreciate any sort of contributions, and don't want a wall of
rules to get in the way of that.

Here are the basic steps to submit a pull request. Make sure that you're working
on an [open issue](https://github.com/rubyforgood/demand-progress/issues)–if the
relevant issue doesn't exist, open it!

1. Claim an issue on
   [our issue tracker](https://github.com/rubyforgood/demand-progress/issues) by
   assigning it to yourself (core team member) or commenting. If the issue
   doesn't exist yet, open it.
1. Fork the repo.
1. Make sure you have yarn installed (e.g. `brew install yarn`).
1. Run `./bin/setup`.
1. Run `./bin/rake committees:house:load` and `./bin/rake committees:senate:load`
   to load the House and Senate committee & sub committee relationships.
1. Optionally, run `./bin/rake db:populate` to add some sample data
   to your database.
1. Run the tests. We only take pull requests with passing tests, and it's great
   to know that you have a clean slate: `./bin/rake`
1. Add a test for your change. If you are adding functionality or fixing a
   bug, you should add a test!
1. Make the test pass.
1. Push to your fork and submit a pull request. Include the issue number
   (ex. `Resolves #1`) in the PR description.

At this point you're waiting on us–we'll try to respond to your PR quickly.
We may suggest some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Use Rails idioms and helpers
* Include tests that fail without your code, and pass with it
* Update the documentation, the surrounding one, examples elsewhere, guides,
  whatever is affected by your contribution
