# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2017.upto(2019) do |n|
  Year.create(name: n)
end

1.upto(12) do |n|
  Month.create(name: n)
end

1.upto(31) do |n|
  Day.create(name: n)
end
