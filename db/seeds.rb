# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
user = User.create(
  email: "mattangriffel@gmail.com",
  password: "foobarbaz",
  provider: "facebook",
  uid: "10102874318868749"
)

user.facebook_friends.create(
  name: "Chris Castiglione",
  work: "One Month",
  location: "New York, NY"
)

user.facebook_friends.create(
  name: "Mike Tanzer",
  work: "D G Capital",
  location: "Princeton, NJ"
)

user.generate_cards
