# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


demoUser = User.create(username: "demo", password: "hellodemo")


bench1 = Bench.create(description: "wassup this neo valley or whatever", lat: 37.751287, lng: -122.430800)
bench2 = Bench.create(description: "russian hill", lat: 37.799, lng: -122.4166)