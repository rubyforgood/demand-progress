# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Committee.delete_all
congress = Committee.create!(name: "115th Congress", website: "https://www.congress.gov/")
senate = Committee.create!(name: "Senate", website: "https://www.senate.gov/", parent: congress)
house = Committee.create!(name: "House", website: "https://www.house.gov/", parent: congress)

