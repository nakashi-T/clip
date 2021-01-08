# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..30).each do |number|
  User.create(name: 'siruko ' + number.to_s, email: 'Siruko' + number.to_s + '@gmail.com', password: 'siruko ' + number.to_s )
end