# This file should contain all the record creation óeeded to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Create category'
Category.create!({
  name: 'En Adopción',
})

Category.create!({
  name: 'Perdidos',
})

Category.create!({
  name: 'Informes',
})

Category.create!({
  name: 'Reencuentro',
})