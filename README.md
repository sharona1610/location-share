## Location Share

A simple app that allows users to add and share locations with other users

- Hosted on Heroku at : `https://fierce-journey-47694.herokuapp.com`
- Github Repo: `https://github.com/sharona1610/location-share.git`

### Local Development Setup

1. Clone repo from https://github.com/sharona1610/location-share.git
2. Run `bundle install` to install all dependencies
3. Run `rake db:migrate` to migrate the database
4. Run `rake db:seed` to seed the db with fake data
5. Run `bin/rails s` to start the server and the application should be available on localhost:3000
6. Run `rake db:test:prepare` to setup the test database
7. Run `rspec` to run specs

#### Tech stack

- Ruby 2.4.1
- Rails 5.2.2
- Postgres
- OpenLayers 5.3.0
- Bootstrap 4
- Rspec

#### Seed user

```
email: first@user.com
password: password
```

### Directions
- Log in with the test user account or register a new user and sign in
- After sign in, on the homepage, you can see a map with 3 columns on the left. The first is the locations created by you, the second is the locations others users have shared with you and the third contains a list of all the other users.
- Click into the locations column and select the locations to focus the map on the locations
- Click on the users to go to their page and see the locations that they have shared which are public
