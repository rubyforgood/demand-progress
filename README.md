# demand-progress

### A functioning democracy requires an engaged citizenry.

Our stakeholder, [Demand Progress](https://demandprogress.org/) is focused on Internet Freedom, Open Government, and Financial Reform. It works on a bipartisan basis to make information about Congress available to the public through the Congressional Data Coalition. In order for civil society to hold government accountable they must keep track of shifting legislative schedules and content.

It is difficult to follow when Congress has scheduled a committee/subcommittee hearing/meeting without a paid subscription to a news service that gathers this info.

The Senate and House release meeting notices online in structured data formats, but there’s no well-designed publicly-available central place to see all the notices from the different committees or subcommittees. (The [closest attempt](https://www.govtrack.us/congress/committees/calendar) is run by GovTrack, and it is good but is missing key features).

The Demand Progress team will build a user-friendly web based weekly agenda (calendar) for congressional hearings and markups. Users will be able to view the week with Monday at the top of the page, with items organized chronologically in a list, broken out by day of the week and hour. Each item will contain sufficient information about the proceeding, including who is holding it (committee and or subcommittee), the subject matter, a link to the committee website, the date and time, and where it can be watched online. With one click, users will be able to add these events to their own calendar, either singly or a set of items at a time. In addition, users will be able to visually identify changed calendar items updated in the last 24 hour. If time allows we will have a couple other stretch goals requested by our stakeholder including a tool for converting PDF's of pre-introduction legislation to plain text and/or a tool for parsing organizational sign-on lists for letters of support.

Team Leads: [David Bock](https://github.com/bokmann) and [Joel Cahalan](https://github.com/compostbrain)

## Local setup

### Repo pulldown and clicky setup

* Fork the repo in Github
* Clone it to your local machine
* Request a ProPublica API key: https://www.propublica.org/datastore/api/propublica-congress-api

### Install dependencies

* Install ruby 2.3.1: `$ rbenv install 2.3.1` or `$ rvm install 2.3.1`
* Install `bundler` gem: `$ gem install bundler`
* Install ruby dependencies: `$ bundle install`
* Install javascript dependencies: `$ yarn install`

### Rig up your environment

* Create your database user in postgres: `$ createuser -s -r demand-progress`
* Create your database and tables: `$ rails db:setup`
* Set your propublica API key: `$ export PROPUBLICA_API_KEY=YOUR_API_KEY_VALUE`
* Load the committees data: `$ rake committees:senate:load && rake committees:house:load`

### Fire it up!

* Start the server: `rails server`
