# README

## Setup
```
bundle install
rake db:create && rake db:migrate && rake db:seed
```

Run tests, with color!:
`bundle exec rspec --format documentation --color`


### Overview
Use single table inheritance to create different types of Card, Betting and Dice Games

Use a polymorphic join table to handle the many-to-many relationship and attach a played instance of a game to a Casino

Please see casino.rb and associated specs for most of the implemented behavior!

There is not much functionality we get from "Game", so Card, Betting and Dice Games do not subclass it.
